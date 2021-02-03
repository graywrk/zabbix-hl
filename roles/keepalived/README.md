keepalived
=========

Install and configure keepalived for master-backup haproxy (default configuration in templates/keepalived.conf.j2)

Requirements
------------

CentOS 7

Role Variables
--------------
keepalived_virtual_router_id
keepalived_virtual_ipaddress
keepalived_priority
keepalived_password

Dependencies
------------

No dependecies

Example Playbook
----------------

- hosts: keepalived_master
  roles:
   - keepalived
  vars:
    keepalived_interface: eth1
    keepalived_virtual_router_id: 1
    keepalived_virtual_ipaddress: 10.0.0.100
    keepalived_priority: 101
    keepalived_password: P@$$w0rd

- hosts: keepalived_backup
  roles:
   - keepalived
  vars:
    keepalived_interface: eth1
    keepalived_virtual_router_id: 1
    keepalived_virtual_ipaddress: 10.0.0.100
    keepalived_priority: 100
    keepalived_password: P@$$w0rd

License
-------

BSD

