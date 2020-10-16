# kube-context.sh

Easily manage your kubernetes contexts using custom yaml configuration files.

## Installation

Add the `kube-context.sh` file anywhere you please, and source it in your `~/.bashrc` or `~/.zshrc` or similar file.

## Usage

Add your kubernetes context configuration as `.yml` or `.yaml` files into `~/.kube/contexts`.

For example:

```
➜  ~ ls ~/.kube/contexts
cluster-a.yaml  cluster-b.yml
```

Now, you can use these as contexts:

```
➜  ~ k config get-contexts
CURRENT   NAME                         CLUSTER     AUTHINFO           NAMESPACE
*         kubernetes-admin@cluster-a   cluster-a   kubernetes-admin   
          kubernetes-admin@cluster-b   cluster-b   kubernetes-admin
```

To load new context files in the current terminal session, run the following command:

```
➜  ~ kube-context-load
```

This command is an alias generated by `kube-context.sh` to allow you to more easily load context files on the fly, instead of starting a new terminal session.

# How it Works

Each time a new shell is created, this script will populate the `KUBECONFIG` environment variable with each `.yml` and `.yaml` file it finds in `~/.kube/contexts`. This allows you to easily use the `kubectl` context switching mechanisms more easily, instead of defining your contexts manually in a separate configuration file.

