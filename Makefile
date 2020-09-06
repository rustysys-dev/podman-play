up:
	podman play kube zulip-deployment.yaml

down: 
	podman pod rm --force zulip-pod-0
