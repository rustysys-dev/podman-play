# Deploy Tikv

Deploy testing cluster for Tikv, requires podman.

### Deploy

using podman play

```bash
sed -i -e "s/rustysysdev/${USER}/g" -e '/mountPath/ s/data$/data:z/g' tikv_pod.yaml
podman play kube tikv_pod.yaml
```

using podman (if play fails for any reason...)

```bash
./tikv.sh
```