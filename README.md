# kube-context.sh

Easily manage your kubernetes contexts using an independent directory of yaml configuration files.

## Installation

Add the `kube-context.sh` file anywhere you please, and source it in your `~/.bashrc`, `~/.zshrc`, or similar file.

## Usage

Add your kubernetes cluster configuration as `.yml` or `.yaml` files into the `~/.kube/contexts` directory:

Note: The `~/.kube/contexts` directory is created when `kube-context.sh` is called.

```
➜  ~ ls ~/.kube/contexts
cluster-a.yaml  cluster-b.yml
```

To load the new context files, either re-source your `rc` file to initialize `kube-context.sh`, or start a new terminal session.

Now you can use your new configuration files as contexts:

```
➜  ~ echo $KUBECONFIG
/home/user/.kube/config:/home/user/.kube/contexts/cluster-a.yaml:/home/user/.kube/contexts/cluster-b.yml

➜  ~ kubectl config get-contexts
CURRENT   NAME                         CLUSTER     AUTHINFO           NAMESPACE
*         kubernetes-admin@cluster-a   cluster-a   kubernetes-admin   
          kubernetes-admin@cluster-b   cluster-b   kubernetes-admin
          
➜  ~ kubectl config use-context kubernetes-admin@cluster-b
Switched to context "kubernetes-admin@cluster-b".

➜  ~ kubectl config get-contexts
CURRENT   NAME                         CLUSTER     AUTHINFO           NAMESPACE
          kubernetes-admin@cluster-a   cluster-a   kubernetes-admin   
*         kubernetes-admin@cluster-b   cluster-b   kubernetes-admin
```

# How it Works

Each time `kube-context.sh` is called, it will populate your `KUBECONFIG` environment variable with each `.yml` and `.yaml` file it finds in `~/.kube/contexts`. This allows you to easily use the `kubectl` context switching mechanisms more easily, instead of defining your contexts manually in a separate configuration file.

You may also still use the default `~/.kube/config` file. If this file exists, it will also be populated into the `KUBECONFIG` environment variable.

