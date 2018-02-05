Role Name
=========

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
