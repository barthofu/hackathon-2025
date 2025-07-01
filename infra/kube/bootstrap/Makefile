.POSIX:
.PHONY: *

default: namespace argocd root

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

argocd:
	cd argocd && ./apply.sh

root:
	cd root && ./apply.sh

infisical:
	cd infisical && ./apply.sh

uninstall:
	kubectl delete namespace argocd
	kubectl delete all --all -n argocd
	kubectl delete namespace infisical
	kubectl delete all --all -n infisical
	kubectl delete applicationset.argoproj.io --all -n argocd