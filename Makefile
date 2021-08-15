VERSION?=latest
APP_SERVER_TAG=appserver:$(VERSION)
USER_SERVICE_TAG=userservice:$(VERSION)
APP_NGINX_TAG=app-nginx:$(VERSION)

build-app-server:
	docker build -f app/Dockerfile -t $(APP_SERVER_TAG) .
build-user-service:
	docker build -f userservice/Dockerfile -t $(USER_SERVICE_TAG) .
build-app-nginx:
	docker build -f nginx/Dockerfile -t $(APP_NGINX_TAG) .
build-all:
	make build-app-server
	make build-user-service
	make build-app-nginx
run-app-server:
	docker run -d -p 3000:3000 $(APP_SERVER_TAG)
run-user-service:
	docker run -d -p 4000:4000 $(USER_SERVICE_TAG)
run-app:
	docker run -d -p 80:80 $(APP_NGINX_TAG)
run-all:
	make run-app-server
	make run-user-service
	make run-app
dashboard:
	minikube dashboard
start:
	minikube service app-nginx-loadbalancer-service
helm-install-dry-run:
	helm install ./k8s --dry-run --generate-name
helm-install:
	helm install test-chart ./k8s
helm-upgrade:
	helm upgrade test-chart ./k8s
helm-uninstall:
	helm uninstall test-chart
# 	eval $(minikube docker-env)