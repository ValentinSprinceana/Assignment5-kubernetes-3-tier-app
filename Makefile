
# Create deployments, services, secrets, SC and PVC
run:
	@kubectl apply -f storageClass.yaml
	@kubectl apply -f data-pvc.yml
	@kubectl apply -f secret.yml
	@kubectl apply -f front-deployment.yaml
	@kubectl apply -f front-service.yaml
	@kubectl apply -f back-deployment.yaml
	@kubectl apply -f back-service.yaml
	@kubectl apply -f data-deployment.yaml
	@kubectl apply -f data-service.yaml

# Create job Data-script
fill-db:
	@kubectl apply -f data-script-job.yaml
#Delete Depoyments, services,secrets
stop:
	@kubectl delete -f data-script-job.yaml
	@kubectl delete -f secret.yml
	@kubectl delete -f front-deployment.yaml
	@kubectl delete -f front-service.yaml
	@kubectl delete -f back-deployment.yaml
	@kubectl delete -f back-service.yaml
	@kubectl delete -f data-deployment.yaml
	@kubectl delete -f data-service.yaml

# Delete  StorageClass and PVC
clean:
	@kubectl delete -f data-pvc.yml
	@kubectl delete -f storageClass.yaml

test:
	@kubectl apply -f test.yaml
	@echo "done."





