# zulip-podman-play
Deploy zulip with podman play w/gitlab oauth

## Project Assumptions

- You have your own working email server.
- You have a GitLab account, or your own GitLab server.

## Configuration

To have a working zulip server w/GitLab OAuth and mail connectivity, variables starting with `__` in the `zulip-deployment.yaml` file must be properly set.

Information on setting these variables can be found [at this LINK][1]
Additional settings can be set as described [at this LINK][2]

## Deployment

Deployment is as simple as:

```bash
make up
```

Deployment may take some time, and may be viewed using the following command.

```bash
podman logs zulip-pod-0-zulip
```

## Initial Setup

Once the pod has been deployed, and all services are running, you need to setup your zulip organization.

1. exec into your container.

```bash
podman exec -ti zulip-pod-0-zulip bash
```

2. run the following commands to get a realm creation link.

```bash
su zulip && cd /home/zulip/
$(find ./ -name manage.py) generate_realm_creation_link
```

3. Open the resultant link in your browser and follow the steps to setup your administrator account and organization.

## Destroy your pod

```bash
make down
```

[1]: https://github.com/zulip/zulip/blob/master/zproject/prod_settings_template.py
[2]: https://github.com/zulip/docker-zulip#configuration
