# Usage
Initialize the terraform plan
make init
Plan the infrastruture to see the changes
make plan
Build the infrastructure
make apply
Login to the kubernetes cluster
make login
Install helm package installer for the cluster
make helm && make tiller
Create an ingress controller for the cluster
make ingress
Create a staging namespace in the cluster and deploy guestbook application on it
make staging
Create a production namespace in the cluster and deploy guestbook application on it
make production
All of the above in a single command, ie create infrastrucure and deploy guestbook on kubernetes
make all
Desrtoy the infrastructure
make destroy
