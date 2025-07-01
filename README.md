# Hackaton 2025

Ce dépôt contient plusieurs applications et bibliothèques pour le projet Hackaton 2025. Il s'agit d'un projet multi-composants, principalement écrit en Python et C, destiné à fournir des services variés autour de la gestion de fichiers, d'événements, et d'accès web. L'applicatif est "forké" de Seafile, un système de gestion de fichiers open source.

## Structure du projet

- **apps/** : Contient des dépendances tierces et des bibliothèques natives.
  - `libevhtp/` : Bibliothèque C pour la gestion HTTP.
  - `libsearpc/` : Bibliothèque RPC légère.
  - `seafdav/` : Serveur WebDAV basé sur WsgiDAV, avec gestion des dépendances Python.
  - `seafevents/` : Gestionnaire d'événements et de tâches en arrière-plan, écrit en Python.
  - `seafile-server/` : Serveur principal (détails non inclus ici).
  - `seafobj/`, `seahub/` : Autres composants du serveur Seafile.
- **docs/** : Documentation du projet.
- **infra/** : Scripts et configurations pour l'infrastructure (Docker, Kubernetes, Terraform).
- **secrets/** : Fichiers de configuration sensibles (ex: kubeconfig).
- **tools/** : Outils divers pour le développement et le déploiement.

## Installation

### Prérequis
- Python 3.8+
- CMake, GCC/Clang pour les composants C
- Docker (optionnel, pour l'infrastructure)

### Installation des dépendances Python

```bash
cd apps/seafdav
pip install -r requirements.txt
```

### Compilation des bibliothèques natives

```bash
cd apps/libevhtp
make

cd ../libsearpc
./autogen.sh && ./configure && make
```

## Lancement des services

Chaque composant possède son propre script de lancement ou Makefile. Par exemple, pour démarrer le serveur WebDAV :

```bash
cd apps/seafdav
python3 -m wsgidav --config sample_wsgidav.yaml
```

Pour les autres services, consultez les README spécifiques dans chaque dossier.

## Tests

Des tests sont disponibles dans les dossiers `tests/` de chaque composant.

## Contribution

1. Forkez le dépôt
2. Créez une branche (`feature/ma-fonctionnalite`)
3. Commitez vos modifications
4. Ouvrez une Pull Request

## Licence

Ce projet est sous licence MIT. Voir les fichiers LICENSE dans chaque dossier pour plus de détails.

## Auteurs

- Équipe Hackaton 2025

---

Pour toute question, consultez la documentation ou ouvrez une issue sur le dépôt.
