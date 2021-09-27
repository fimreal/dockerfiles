---
### Usage

Command line Cli:
```bash
docker run --rm -it -v $KUBECONFIG:/root/.kube/config epurs/k9s-with-gotty /bin/k9s
```
or serve by gotty
```bash
docker run --rm -d -p8080:8080 -v ~/.kube/config:/root/.kube/config epurs/k9s-with-gotty
```

or run on k8s/k3s
```bash
   # Maybe in the future.
```
