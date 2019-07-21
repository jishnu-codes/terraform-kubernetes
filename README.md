# terraform-kubernetes
Experiments in infra development using terraform and kubernetes

This is an infra-builder more or less a wrapper to terraform and kubernetes client. 
The purpose here is to completely automate the infrastructure development, kubernetes configureation and application deplpoyment
kubernetes. It also provides a tool for load testing on applications depployed on kubernetes. 

Using this, you will be able to do the following:
1. Create the infrastrucutre in GCP using terraform modules
2. Setting up the kubernetes
3. Creating namespaces and ingress controller for kubernetes 
4. Deploy applications on kubernetes namespaces staging and production
5. Create HPA for application pods
6. Check load testing on applications
7. Destroy the infrastructure

# Preparation
1. You must be having a GCP account ready (Free tier account can be used)
2. Create a project under the account as the project ID should be passed to terraform code as variable.
3. Create a service account to be used for terraform to contact the GCP API for resource creation, the credentials for this
   can be saved under ./creds/serviceaccount.json file
   This is omitted in this repo as this contains the logins to the GCP account and is mentioned in the .gitignore file.
4. Install the gcloud and kubectl utilities so that you can play around with GCP and Kubernetes cluster. 
   The reference is given below to do the same:
   Gloud: https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
   Kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/

# Getting Started
Clone the repository and add credentions under ./creds/serviceaccount.json file
Add the project ID in the variables.tf under the variable "project" and you can also give the same or appropriate name for the cluster using the variable "cluster_name".
Save and quit the file. There you go.

1. Initialize the terraform plan
make init
2. Plan the infrastruture to see the changes
make plan
3. Build the infrastructure
make apply
4. Login to the kubernetes cluster
make login
5. Install helm package installer for the cluster
make helm && make tiller
6. Create an ingress controller for the cluster
make ingress
7. Create a staging namespace in the cluster and deploy guestbook application on it
make staging
8. Create a production namespace in the cluster and deploy guestbook application on it
make production
9. All of the above in a single command, ie create infrastrucure and deploy guestbook on kubernetes
make all
10. Desrtoy the infrastructure
make destroy
