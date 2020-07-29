# Kubernetes short commands
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"
alias kgl="kubectl logs -f"
alias kxp="kubectl exec -it"
alias kgl="kubectl logs $@"
alias kpf="kubectl port-forward $@"

# Helm short commands
alias hi="helm install $@"
alias hu="helm uninstall $@"