# download metrics-server yaml save to file
curl -L -o metrics-server.yaml https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
yq eval 'select(.kind == "Deployment").spec.template.spec.tolerations += [{"key": "node-role.kubernetes.io/control-plane", "operator": "Exists", "effect": "NoSchedule"}]' -i metrics-server.yaml
yq eval 'select(.kind == "Deployment").spec.template.spec.containers[].args += ["--kubelet-insecure-tls"]' -i  metrics-server.yaml
kubectl apply -f metrics-server.yaml
rm metrics-server.yaml