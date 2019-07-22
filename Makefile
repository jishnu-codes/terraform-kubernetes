.PHONY: init plan apply

TAG		 := 0.0.1
NAME     := infra-builder


init:
	terraform init



plan: init 
	terraform plan

apply: init plan
	terraform apply
login: 
	gcloud container clusters get-credentials mstakx-jishnu --zone europe-west1-b --project mstakx-jishnu

helm: 
	curl -o get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get
	chmod +x get_helm.sh
	./get_helm.sh

tiller:
	kubectl create serviceaccount -n kube-system tiller
	kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
	helm init --service-account tiller
	sleep 60

ingress: 
	helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true --set controller.publishService.enabled=true


staging: 
	kubectl create namespace staging
	kubectl apply -f ./kube-deployments/redis-master-deployment.yaml -n staging
	kubectl apply -f ./kube-deployments/redis-master-service.yaml -n staging
	kubectl apply -f ./kube-deployments/redis-slave-deployment.yaml -n staging
	kubectl apply -f ./kube-deployments/redis-slave-service.yaml -n staging
	kubectl apply -f ./kube-deployments/frontend-deployment.yaml -n staging
	kubectl apply -f ./kube-deployments/frontend-service.yaml -n staging
	kubectl apply -f ./kube-deployments/ingress-resource-staging.yml -n staging

hpa-staging: 
	kubectl autoscale deployment frontend --cpu-percent=10 --min=1 --max=5 -n staging

production:
	kubectl create namespace production
	kubectl apply -f ./kube-deployments/redis-master-deployment.yaml -n production
	kubectl apply -f ./kube-deployments/redis-master-service.yaml -n production
	kubectl apply -f ./kube-deployments/redis-slave-deployment.yaml -n production
	kubectl apply -f ./kube-deployments/redis-slave-service.yaml -n production
	kubectl apply -f ./kube-deployments/frontend-deployment.yaml -n production
	kubectl apply -f ./kube-deployments/frontend-service.yaml -n production
	kubectl apply -f ./kube-deployments/ingress-resource-production.yml -n production

hpa-production:
	kubectl autoscale deployment frontend --cpu-percent=10 --min=1 --max=5 -n production
all: init plan apply login helm tiller ingress staging producton hpa-staging hpa-production
	echo "Finished creating cluster for kubernetes and deployed the application to staging and production environments"

destroy:
	terraform destroy
