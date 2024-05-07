# PPEAgentDeployment

An Ansible playbook used to configure and deploy PPEAgent on Kubernetes cluster

## Requirements

- Ansible
- Kubernetes cluster
- Helm

## Installation

1. Clone the repository

    ```bash
    git \
        clone \
        --branch=master \
        --depth=1 \
        https://github.com/kamilrybacki/PPEAgentDeployment.git
    ```

2. Change the directory to the cloned repository

3. Set the variables in `group_vars` of the environment you want to deploy to

4. Run the playbook to deploy PPEAgent

    ```bash
    ansible-playbook \
        --inventory \
            ./environments/<ENVIRONMENT NAME>/ \
        install.yml
    ```

To uninstall PPEAgent, run the playbook with the `uninstall.yml` file

```bash
ansible-playbook \
    --inventory \
        ./environments/<ENVIRONMENT NAME>/ \
    uninstall.yml
```

## Usage

After deploying PPEAgent, you can access the service by visiting
the URL provided in the output of the playbook **if** the Ingress resource
was created.

If not - you must [port-forward the service manually] to
access it from the host machine.

## Configuration

### Global variables

**Convention**: Global variables are prepended only with the playbook name i.e.
`ppeagentdeployment_` and are to be set in the `group_vars` directory
of the environment you want to deploy to.

The playbook uses the following playbook-wide variables:

- (**REQUIRED**) `ppeagentdeployment_namespace` - Namespace to deploy PPEAgent to
- `ppeagentdeployment_kubeconfig` - Path to the `kubectl` configuration file (default: `$HOME/.kube/config`)
- `ppeagentdeployment_cluster_domain` - Cluster domain (default: `cluster.local`)

The defaults for these variables are set in the `group_vars/ppeagent.yml` file.

### Role-specific variables

**Convention**: Role variables are prepended with the playbook name followed by the role name and separated by an underscore i.e. `ppeagentdeploment_service_`
and are to be set in the `group_vars` directory of the environment you want
to deploy PPEAagent to (with defaults set in the role's `defaults/main.yml` file).

Each role is responsible for a specific part of the deployment process and
contains a set of tasks that need to be executed. The roles are:

- [`service`] - Deploys the standalone PPEAgent service

To see the detailed description of each role **and its configuration**,
please refer to the `README.md` file in the corresponding role directory.

[port-forward the service manually]: https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
[`service`]: ./roles/service/README.md
