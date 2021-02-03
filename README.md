env ANSIBLE_CONFIG="./ansible.cfg" ansible all -m ping
env ANSIBLE_CONFIG="./ansible.cfg" ansible-playbook site.yml

ssh -C -F ./ssh.cfg adminroot@host

Адресация:
10.0.70.0/24

patroni: 
postresql 10.0.70.1x
consul 10.0.70.2x
haproxy 10.0.70.3x