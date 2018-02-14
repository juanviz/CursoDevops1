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

Kubernetes Cluster with kops and Minecraft in AWS
-------------------------------------------------
export KOPS_STATE_STORE=s3://k8s-juanvi2-state-store

export NAME=juanvi.k8s.local

kops create cluster     --zones eu-west-1a     ${NAME}

kops edit cluster ${NAME}

kops create cluster     --zones eu-west-1a     ${NAME} --yes

kops update cluster juanvi.k8s.local --yes

kops validate cluster

kubectl get nodes --show-labels

kops get cluster

kops edit ig --name=$NAME nodes

kops edit ig --name=$NAME master-eu-west-1a

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl proxy --port=8080 &

kubectl run sample-nginx --image=nginx --replicas=2 --port=80

kubectl get pods

kubectl get deployments

kubectl expose deployment sample-nginx --port=80 --type=LoadBalancer

kubectl get services -o wide

kubectl create -f deployment-minecraft.yaml

kubectl get rc

kubectl get pods

kubectl create -f service-minecraft.yaml

kubectl describe service minecraft

kops delete cluster --name=$NAME —yes


License
-------

GPL

Author Information
------------------

@jvicenteherrera
juanvicenteherrera.eu
