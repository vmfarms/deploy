# VM Farms deployment tools

This is a collection of Ansible playbooks help deploy your code to your [VM Farms](http://vmfarms.com/) infrastructure.

Ansible is a simple IT automation tool that features:

* a simple, human-readable YAML DSL
* linear task execution
* idempotent, reusable tasks
* agentless operation

Because Ansible is agentless, your servers are already configured to use it for automated deployments. For more information and a general introduction to Ansible, check out the [documentation](http://docs.ansible.com/).

## Getting started

1. [Install Ansible](http://docs.ansible.com/intro_installation.html).

    On Mac OS X, use [Homebrew](http://brew.sh).

    ```
    $ brew install ansible
    ```

    On Red Hat-based distributions, including Fedora and CentOS:

    ```
    $ sudo yum install ansible
    ```

    On Debian-based distributions, including Ubuntu:

    ```
    $ sudo apt-get install ansible
    ```

2. Clone this repository.

    ```
    $ git clone https://github.com/vmfarms/deploy.git
    ```

## Inventory

An [inventory](http://docs.ansible.com/intro_inventory.html) categorizes hosts into groups (e.g., `app`, `db`, `cache`). It uses a simple INI-style configuration format.

An example inventory file for a small load-balanced application might look like:

```
[app]
203.0.113.2
203.0.113.3

[cache]
203.0.113.4

[db]
203.0.113.5
```

## Playbooks

See the [playbooks](./playbooks) directory for deployment playbooks. We aim to provide playbooks for each of [our supported application stacks](http://vmfarms.com/our-platform/).

## Variables

The playbooks refer to a standard set of variables:

* `app`

    Application name (usually your domain). This corresponds to the main path under `/data/web` (e.g., `/data/web/example.org`).
* `repo_url`

    Remote Git repository URL.
* `war_archive`

    Path to Tomcat 7 WAR file.

Add these variables to a `vars.yml` file in the same directory as the playbook. For example, `vars.yml` for a Django application might look like:

```yaml
# vars.yml
app: example.org
repo_url: git@github.com:example/example.git
```

## Deploying your application

To deploy your application, you would run:

```
$ ansible-playbook -i /path/to/inventory <playbook>.yml
```

where `<playbook>` represents your application stack. The provided deployment playbooks will run against hosts in the `app` group.

## Contributing

Please feel free to open [issues](https://github.com/vmfarms/deploy/issues) for bug reports and questions. 
