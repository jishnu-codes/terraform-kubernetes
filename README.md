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
