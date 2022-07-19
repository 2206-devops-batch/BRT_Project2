minikube start
minikube status
minikube ip
kubectl cluster-info 

# run yaml
kubectl apply -f '/home/webmaster/documents/BRT_Project2/kubernetes/flask-service.yaml'
kubectl apply -f '/home/webmaster/documents/BRT_Project2/kubernetes/flask-deployment.yaml'

kubectl get all
