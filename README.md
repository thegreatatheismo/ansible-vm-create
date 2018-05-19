VM-Create
=========

Deploy Virtual Machines on KVM via a local kickstart.

Requirements
------------

For this role to work you will require installation media (an ISO mounted locally or shared via a web server), and a working kickstart.

Role Variables
--------------

An example of the values is provided in `defaults/main.yml`.

`vm_name`: Display name of the VM.

`vm_ram`: How much memory the VM will have.

`vm_cpu`: How many cores the VM will have.

`vm_os`: The OS to be installed (same as installation media).

`vm_disk_size`: Size of the virtual disk.

`vm_bridge`: The network bridge the VM will use.

`vm_media`: Path to the installation media.

`vm_ks`: Path to the kickstart.


Dependencies
------------

A kickstart and an RHEL/CentOS/Fedora are required for this role. These can be local, or shared via a webserver. An example kickstart included in the templates direcroty.

Example Playbook
----------------

A basic playbook is all that's required:

    - hosts: servers
      roles:
         - { role: vm-create }

License
-------

BSD

Author Information
------------------

Just your average Linux Admin.

