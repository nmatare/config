export PYTHONBREAKPOINT="import ipdb; from Ipython import embed; embed(); ipdb.set_trace()"

alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"
alias kgl="kubectl logs $1 -f"