clear
echo
echo
echo minikube app initializer
echo
echo
echo ---------------------------------------
echo
echo

minikube start
echo
echo

echo ---------------------------------------
echo
echo

echo getting files from the repo
echo
echo

git clone https://github.com/TDiazSouble/spring-boot-app
echo
echo

echo ---------------------------------------
echo
echo

echo deleting old deployments
echo
echo

kubectl delete deployments springboot-kubernetes 
echo
echo

echo ---------------------------------------
echo
echo

echo deleting old services
echo
echo

kubectl delete services springboot-kubernetes 
echo
echo

echo ---------------------------------------
echo
echo

echo "integrating docker in minikube"
echo
echo

eval $(minikube docker-env)

echo ---------------------------------------
echo
echo

echo "Building docker image"
echo
echo

(cd spring-boot-app;docker build -t spring-app-image:springboot .)
echo
echo

echo ---------------------------------------
echo
echo

echo "Creating new deployment"

echo
echo

kubectl create deployment springboot-kubernetes --image=spring-app-image:springboot --port=8080

echo
echo

echo ---------------------------------------
echo
echo

echo "Exposing ports"

echo
echo

kubectl expose deployment springboot-kubernetes --type=NodePort
echo
echo

echo ---------------------------------------
echo
echo

echo "To start the services after pods are initializer, input: 'minikube service springboot-kubernetes'"

echo
echo

echo ---------------------------------------
echo
echo
