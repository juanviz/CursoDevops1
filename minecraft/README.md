Role Name
=========

Install a Minecraft Server in a Raspberry Pi with Ubuntu or as container in microk8s or any Kubernetes compatible cluster

Requirements
------------
Ubuntu for Raspberry Pi 4

Workstation with Ansible 2.9 installed

Workaround for run microk8s properly
------------

1. Edit /var/snap/microk8s/current/args/containerd file and change --root and --state folders to /mnt/

```bash
$ sudo cat /var/snap/microk8s/current/args/containerd
--config ${SNAP_DATA}/args/containerd.toml
--root /mnt/var/lib/containerd
--state /mnt/run/containerd
--address ${SNAP_COMMON}/run/containerd.sock
```
2. K8s was complaining that the cgroup memory was not enabled. 

Looking at /proc/cgroups was showing memeory disabled. 

Edit  /boot/firmware/nobtcmd.txt file, appending cgroup_enable=memory cgroup_memory=1. and rebooting.


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

```bash
Better if you add to $HOME/.ssh/config the following entry:

Host 192.168.1.132
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/raspi
   user ubuntu
```


Docker Build
----------------
```bash
$ cd minecraft/files
$ docker build -t juanviz/rpi-minecraft-spigot .
$ docker images

$ juanviz/rpi-minecraft-alpine-spigot   latest              bd3ef31059fe        23 minutes ago         232MB
$ docker tag bd3ef31059fe juanviz/rpi-minecraft-alpine-spigot
$ docker push juanviz/rpi-minecraft-alpine-spigot
```


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: '{{host}}'
  roles:
    - /Users/jvherrera/repositories/minecraft_ansible/minecraft

Usage

----------------

# Deploy in ec2 instance with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=ec2 mode=pi boot=yes"

# Deploy in Raspberry Pi with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=pi mode=pi boot=yes"

# Deploy in microk8s in a Raspberry Pi with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=pi mode=k8s"

#TODO
change minecraft image for k8s depends of the architecture (current Dockerfile is for Raspberry Pi 4)


References
----------------
minecraft.net

ansible.com

Raspberry Pi

https://www.spigotmc.org/wiki/spigot-installation/#linux

http://minecraft.gamepedia.com/Pi_Edition

https://www.raspberrypi.org/learning/getting-started-with-minecraft-pi/worksheet/

https://pimylifeup.com/raspberry-pi-minecraft-server/

https://hub.docker.com/r/ulsmith/rpi-minecraft-alpine-spigot

EC2

https://qwiklabs.com/focuses/2628?locale=en


License
-------

BSD

Author Information
------------------

@jvicenteherrera

juanvicenteherrera.eu
