minikube start
minikube status
minikube ip
kubectl get pods all
kubectl cluster-info

# run yaml
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo-secrets.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo-express-configmap.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongodb-express-deployment.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongodb-deployment.yaml" 
