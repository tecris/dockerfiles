# ansible-util

## Synopsis

Role for base configuration of Ansible roles developed at Silpion.


This role implements common requirements for Ansible itself and
a persistency paradigm for down- and uploaded data in particular.
Also, it is used to distribute various facts to achieve a common module behaviour
across different roles.

Target is to reduce redundancy in Ansible role code and to have
a single point of dependency in terms of Ansible requirements/
dependencies.

## Requirements

None.

## Role Variables

* ``util_template_use_cow``: Whether to add {{ ansible_managed }} or a fancy cow to templates (boolean, default: ``true``)
* ``util_package_list_custom``: Custom list of packages to be installed (list, default: ``[]``)
* ``util_init_system``: Allow to override init system configuration to be used for service templates (string, default: ``''``)

### util_init_system

Roles supporting a various number of operating systems and versions do require
to know what init system to configure for services. The util_init_system variable
allows to hardcode that on inventory level for a specific project and is
configured dynamically otherwise, e.g.

- Archlinux: systemd
- CentOS 6: sysvinit
- CentOS 7: systemd
- Ubuntu: upstart
- et cetera

``util_init_system`` value is written to local facts accessable with
``ansible_local['util']['init']['system']``. This fact may get used in
other roles to ease configuration of service management.

The following values are supported (and therefor required):

- ``systemd``
- ``sysvinit``
- ``upstart``

### action modules

As of ansible ``1.9.`` the become framework has been integrated into mainline.
This role makes the become framework configurable for local_action and action
modules.

As of ansible ``1.9.`` the keywords

* become
* become_user
* become_method
* sudo
* sudo_user

do not support templating for dynamic configuration, e.g.

    - name: I am some task
      become: "{{ util_action_become_enable }}"
      become_user: "{{ util_action_become_user|default('root') }}"
      become_method: "{{ util_action_become_method|default('sudo') }}"
      action: file
        state=absent
        dest=/tmp/foo

results in an internal error, because there is no variable substitution
taking place. Configuring sudo and sudo_user arguments does not escalate
privileges if util_action_become_enable is configured boolean true.


I consider this a bug in ansible which is fixed in ``v2``.


Anyway the following variables might get configured, but until ansible ``v2``
comes around the roles (including this one) will still use hardcoded sudo
configuration.

* ``util_action_become_enable``: Whether to use sudo for action modules (boolean, default: ``true``)
* ``util_action_become_user``: Username to escalate privileges to for action modules (string, default: ``root``)
* ``util_action_become_method``: Privileges escalation method to use (string, default: **not in use**)
* ``util_local_action_become_enable``: Whether to use sudo for local\_action modules (boolean, default: ``true``)
* ``util_local_action_become_user``: Username to escalate privileges to for local\_action modules (string, default: ``root``)
* ``util_local_action_become_method``: Privileges escalation method to use (string, default: **not in use**)

#### Backward compatibility

The following variables reside for backward compatibility and will get
removed in future releases. These variables currently do not have any
effect (see action modules documentation above).

* ``util_local_action_sudo_enable``: Whether to run local_action with sudo: true (boolean, default: ``true``)
* ``util_local_action_sudo_user``: Configure sudo\_user argument to local\_action tasks (string, default: ``|default(omit)``)

### Persistency

This part of the role is used to provide an asset caching mechanism.

This is done by first downloading the assets to the local machine, then copying them over to the remote node that is beeing managed.

#### local

* ``util_persistent_data_path_local``: Where to download data from the internet to the local machine (string, default: ``{{ lookup('env', 'HOME') + '/.ansible/assets' }}``)
* ``util_persistent_data_path_local_owner``: Owner for the local persistent data directory (string, default: ``|default(omit)``)
* ``util_persistent_data_path_local_group``: Group for the local persistent data directory (string, default: ``|default(omit)``)
* ``util_persistent_data_path_local_mode``: Octal access mode for the local persistent data directory (string, default: ``|default(omit)``)

#### remote

* ``util_persistent_data_path_remote``: Where to upload data from the local machine to the managed node (string, default: ``/usr/local/src/ansible/assets``)
* ``util_persistent_data_path_remote_owner``: Owner for the remote persistent data directory (string, default: ``|default(omit)``)
* ``util_persistent_data_path_remote_group``: Group for the remote persistent data directory (string, default: ``|default(omit)``)
* ``util_persistent_data_path_remote_mode``: Octal access mode for the remote persistent data directory (string, default: ``|default(omit)``)

### modules

* ``util_module_get_url_timeout``: Configure get_url timeout= argument (int, default: ``10``)
* ``util_module_service_manage``: Whether Ansible should manage services with the service module (boolean, default: ``true``)
* ``util_module_service_allow_reload``: Whether Ansible handlers are allowed to reload services (boolean, default: ``true``)
* ``util_module_service_allow_restart``: Whether Ansible handlers are allowed to restart services (boolean, default: ``true``)

### ansible_os_family == 'Debian'

* ``util_apt_cache_valid_time``: Configure apt module cache_valid_time parameter (int, default: ``3600``)

### ansible_os_family == 'RedHat'

* ``util_epel_enable``: Whether to enable or disable EPEL repository (boolean, default: ``true``)
* ``util_epel_baseurl``: URL for the EPEL repository (string, default: ``http://download.fedoraproject.org/pub/epel``)

## Local facts

This role distributes various variables as local facts for third party roles to use.

The role tries to discover most of these facts, but they can be manually set using the corresponding variables.
Check variable documentation above for details.

All facts are prefixed with ``ansible_local.util`` so a sample access path could look like this: ``ansible_local.util.init.system``.
The table below omits this prefix.

| Fact name                         | Fact description                               | Variable name                                 | Distributed when                      |
|-----------------------------------|------------------------------------------------|-----------------------------------------------|---------------------------------------|
| ``general.template_use_cow``      | Wether the cow is used for templates           | ``util_template_use_cow``                     | always                                |
| ``general.package_state``         | Desired package state                          | ``util_package_state_{{ ansible_os_family}}`` | always                                |
| ``general.persistent_data_path``  | Persistent data path                           | ``util_persistent_data_path_remote``          | always                                |
| ``init.system``                   | Init system type                               | ``util_init_system``                          | always                                |
| ``modules.get_url.timeout``       | Timeout for the ``get_url`` module             | ``util_module_get_url_timeout``               | always                                |
| ``modules.service.manage``        | Wether the service module may be used          | ``util_module_service_manage``                | always                                |
| ``modules.service.allow_reload``  | Wether the service module may reload services  | ``util_module_service_allow_reload``          | always                                |
| ``modules.serivce.allow_restart`` | Wether the service module may restart services | ``util_module_service_allow_restart``         | always                                |
| ``epel.enabled``                  | Wether EPEL is enabled on this system          | ``util_epel_enable``                          | ``{{ ansible_os_family }} == RedHat`` |
| ``modules.apt.cache_valid_time``  | Apt cache valid time                           | ``util_apt_cache_valid_time``                 | ``{{ ansible_os_family }} == Debian`` |


## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: ansible-util }

## License

Apache Version 2.0

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

- Currently supports ansible_os_family == 'Debian' only.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

    # install role specific dependencies with bundler
    bundle install

<!-- -->

    # run the complete test suite with Docker
    rake suite

<!-- -->

    # run the complete test suite with Vagrant
    RAKE_ANSIBLE_USE_VAGRANT=1 rake suite


## Author information

Mark Kusch @silpion.de mark.kusch


<!-- vim: set nofen ts=4 sw=4 et: -->
