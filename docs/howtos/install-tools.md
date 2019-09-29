# HOWTO: install tools

This is just a time saver so I don't have to hunt around for these

## kubectl

https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl $HOME/.local/bin/
```

## doctl

https://github.com/digitalocean/doctl#installing-doctl

```
env VERSION=1.32.2 sh -c 'curl -sL https://github.com/digitalocean/doctl/releases/download/v$VERSION/doctl-$VERSION-linux-amd64.tar.gz | tar -xzv && mv doctl $HOME/.local/bin/'
