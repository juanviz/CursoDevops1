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

# Deploy in ec2 instance with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=ec2 mode=pi boot=yes"

# Deploy in Raspberry Pi with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=pi mode=pi boot=yes"

# Deploy in microk8s in a Raspberry Pi with Ubuntu
ansible-playbook  -i minecraft/inventory.yml -u ubuntu  minecraft/minecraft.yml  --extra-vars "host=pi mode=k8s"

#TODO
change minecraft image for k8s depends of the architecture (current Dockerfile is for Raspberry Pi 4)

terraform destroy

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
