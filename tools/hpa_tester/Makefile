.PHONY: hpa-staging stag-stress prod-stress hpa-prod

TAG		 := 0.0.1
NAME     := frontend-load-tester


hpa-staging:
	kubectl get hpa -n staging



stag-stress: 
	sh ./stag-apply-load.sh &

prod-stress:
	sh ./prod-apply-load.sh &


hpa-prod:
	kubectl get hpa -n production
