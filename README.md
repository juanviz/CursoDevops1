Role Name
=========
Terraform plan 
--------------
For create the infrastructure in AWS execute: 

terraform plan

terraform apply

For get a graph with the resources creted with terraform ...

sudo apt-get install graphviz or http://www.graphviz.org/Download..php

terraform graph | dot -Tpng > minecraftTF.png

ansible-playbook  -i minecraft/inventory.yml -u ubuntu --sudo minecraft/minecraft.yml  --extra-vars "host=ec2 boot=yes"

ansible-playbook -i -i minecraft/inventory.yml -u ubuntu --sudo minecraft/minecraft.yml  --extra-vars "host=ec2 ansible_user=ubuntu boot=yes minecraft_user=ubuntu minecraft_server=minecraft_server.1.12.2.jar max_player=20 distance=10 memory=678"

terraform destroy

Ansible Roles 

Requirements
------------
Ansible (Tested in 1.9)
SSH access to servers (Recommended RSA keypairs for SSH access)


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: '{{host}}'
  roles:
    - { role: /Users/jvherrera/repositories/minecraft_ansible/yauh.java8, when: host != 'pi' }
    - /Users/jvherrera/repositories/minecraft_ansible/minecraft

Usage
----------------
ansible-playbook  -i inventory.yml -u pi --ask-pass --sudo minecraft.yml  --extra-vars "host=pi boot=yes/no (optional)" //with password user
ansible-playbook  -i inventory.yml -u ubuntu --sudo minecraft.yml  --extra-vars "host=ec2 boot=yes/no (optional)" //with keypair RSA

License
-------

GPL

Author Information
------------------

@jvicenteherrera
juanvicenteherrera.eu
