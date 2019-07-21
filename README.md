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
