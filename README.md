# Zabbix-HA

### Схема проекта

![] zabbix-hl.png

### Запуск
terraform init
terraform apply

изменить IP в hosts и ansible.cfg

env ANSIBLE_CONFIG="./ansible.cfg" ansible-playbook site.yml

### Доступ по SSH
ssh -C -F ./ssh.cfg adminroot@host