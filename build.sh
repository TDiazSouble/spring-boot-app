minikube start

echo ---------------------------------------

echo getting files from the repo

#git clone https://github.com/TDiazSouble/spring-boot-app

echo ---------------------------------------

echo deleting old deployments

kubectl delete deployments springboot-kubernetes 

echo ---------------------------------------

echo deleting old services

kubectl delete services springboot-kubernetes 

echo ---------------------------------------

echo "integrating docker in minikube"

eval $(minikube docker-env)

echo ---------------------------------------

echo "Building docker image"

(cd spring-boot-app;docker build -t spring-app-image:springboot .)

echo ---------------------------------------

echo "Creating new deployment"

kubectl create deployment springboot-kubernetes --image=spring-app-image:springboot --port=8080

echo ---------------------------------------

echo "Exposing ports"

kubectl expose deployment springboot-kubernetes --type=NodePort

echo ---------------------------------------

echo "Activating services"

minikube service springboot-kubernetes 

echo ---------------------------------------
