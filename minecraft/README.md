Role Name
=========

Install Java 8 by Oracle and a Minecraft Server

Requirements
------------
You have to open port 25565 in firewall for public access to server


Role Variables
--------------

ansible_user=pi // System user
minecraft_user=pi // Minecraft Server user
minecraft_server=spigot.jar // executable version for running server 
max_player=5 // simultaneous players in Server
distance=04 // Draw distance of the server
memory=364 // RAM for run the server

Dependencies
------------


Better if you add to $HOME/.ssh/config the following entry:

Host minecraft.quimerus.es
 User ubuntu
IdentityFile ~/.ssh/minecraft-server.pem

Ubuntu Server or Raspbian Wheezy

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

References
----------------
minecraft.net
ansible.com
Raspberry Pi
https://www.spigotmc.org/wiki/spigot-installation/#linux
http://minecraft.gamepedia.com/Pi_Edition
https://www.raspberrypi.org/learning/getting-started-with-minecraft-pi/worksheet/
https://pimylifeup.com/raspberry-pi-minecraft-server/
EC2
https://qwiklabs.com/focuses/2628?locale=en

License
-------

BSD

Author Information
------------------

@jvicenteherrera
juanvicenteherrera.eu