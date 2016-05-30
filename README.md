# VM Farms deployment examples

This is a collection of [Ansistrano](https://github.com/ansistrano/deploy) examples to help deploy your code to your [VM Farms](http://vmfarms.com/) infrastructure.

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

3. Install [Ansistrano](https://github.com/ansistrano/deploy).

    ```
    $ ./bootstrap.sh
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

See the [examples](./examples) directory for deployment playbooks. We aim to provide playbooks for each of [our supported application stacks](http://vmfarms.com/our-platform/).

## Deploying your application

To deploy your application, you would run:

```
$ ansible-playbook -u deploy -i /path/to/inventory deploy.yml
```

Ansible commands can be unwieldy. Refer to [`deploy.sh`](./deploy.sh) as an example of how to wrap this command.

## Contributing

Please feel free to open [issues](https://github.com/vmfarms/deploy/issues) for bug reports and questions. 
