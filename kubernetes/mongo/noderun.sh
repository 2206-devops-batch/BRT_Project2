minikube start
minikube status
minikube ip
kubectl cluster-info

# run yaml
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo/mongo-secrets.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo/mongo-express-configmap.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo/mongodb-express-deployment.yaml" 
kubectl apply -f "/home/webmaster/documents/BRT_Project2/kubernetes/mongo/mongodb-deployment.yaml" 
kubectl get all
