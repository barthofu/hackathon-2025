{
  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, systems, }:
    let
      forEachSystem = f:
        nixpkgs.lib.genAttrs (import systems) (system:
          f {
            pkgs = import nixpkgs {
              config.allowUnfree = true;
              inherit system;
            };
          });
    in {
      devShells = forEachSystem ({ pkgs }: {
        default = pkgs.mkShell {

          # env
          LC_ALL = "C.UTF-8";
          LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
          ANSIBLE_VAULT_PASSWORD_FILE="${toString ./secrets/.vault_pass}";

          shellHook = ''
            mkdir -p ~/.kube && cp -r ./secrets/.kube/cluster.kube.config ~/.kube/config
            if [ -f .env ]; then
              set -a
              . ./.env
              set +a
            fi
            alias tf=terraform
          '';

          packages = with pkgs; [
            # languages
            python3
            go_1_22
            nodejs-18_x
            nodePackages.pnpm

            # iac
            packer
            terraform
            pulumi-bin
            pkgs.pulumiPackages.pulumi-language-nodejs
            pkgs.pulumiPackages.pulumi-language-go
            pkgs.pulumiPackages.pulumi-command
            ansible
            ansible-lint

            # kubernetes
            kubectl
            argocd
            k9s
            kubernetes-helm
            kustomize

            # secrets
            git-crypt

            # misc
            gh
            docker
            git
            bmake
            jq
            lazygit
            d2
            coder
            zsh
          ];
        };
      });
    };
}
