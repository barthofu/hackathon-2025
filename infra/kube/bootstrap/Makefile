.POSIX:
.PHONY: *

default: prepare bootstrap

prepare: traefik
bootstrap: argocd infisical root 

traefik:
	cd traefik && ./apply.sh

argocd:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -
	cd argocd && ./apply.sh

root:
	cd root && ./apply.sh

infisical:
	kubectl create namespace infisical --dry-run=client --output=yaml \
		| kubectl apply -f -
	cd infisical && ./apply.sh

uninstall:
	kubectl delete namespace argocd
	kubectl delete all --all -n argocd
	kubectl delete namespace infisical
	kubectl delete all --all -n infisical
	kubectl delete applicationset.argoproj.io --all -n argocd