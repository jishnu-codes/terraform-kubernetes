.PHONY: staging stag-stress prod-stress prod

TAG		 := 0.0.1
NAME     := frontend-load-tester


staging:
	kubectl get hpa -n staging



stag-stress: 
	sh ./stag-apply-load.sh &

prod-stress:
	sh ./prod-apply-load.sh &


prod:
	kubectl get hpa -n production
