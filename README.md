# k
Exec into kubernetes pod easy (via kubectl)

## Installation
### macOS
`brew install yggheim/tap/k`

## How it works
- select a context from your kubectl config `~/.kube/config`
- select pod from this context
- select a container from the pod
- `kubectl exec -it` into that what you've selected
