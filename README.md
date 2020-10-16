# kube-context.sh

Easily manage your Kubernetes context files using a custom directory of yaml configuration files.

## Installation

Add the `kube-context.sh` file anywhere you please, and source it in your `~/.bashrc` or `~/.zshrc` or similar file.

## Usage

Add your Kubernetes configuration files as `.yml` or `.yaml` files into `~/.kube/contexts`.

For example:

```
➜  ~ ls ~/.kube/contexts
cluster01.yaml  cluster-supersecret.yaml  cluster-test.yml
```

Now, you can use these as contexts:

```
➜  ~ k config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin
```

# How it Works

Each time a new shell is created, this script will populate the `KUBECONFIG` environment variable with each `.yml` and `.yaml` file it finds in `~/.kube/contexts`. This allows you to easily use the `kubectl` context switching mechanisms more easily, instead of defining your contexts manually in a separate configuration file.

