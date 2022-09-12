# NeuedaTaskFinal



#START MINIKUBE
minikube start (note docker daemon must be running - the default is 
--docker driver i.e minikube start -- docker-driver
)

kubectl get nodes 

#apply all the K8s yaml files together like
kubectl apply -f encrypt-deployment.yaml,decrypt-deployment.yaml,env_file-configmap.yaml,outputdatavolume-persistentvolumeclaim.yaml