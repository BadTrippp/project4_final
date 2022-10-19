#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
kubectl delete pod app
# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=badtrip/udacity-project4

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run app --image=$dockerpath --port=8000

# Step 3:
# List kubernetes pods
kubectl get pods 
sleep 10
# Step 4:
# Forward the container port to a host
kubectl port-forward pod/app 8000:80 >> ./output_txt_files/kubernetes_out.txt &
#log app
kubectl logs -f app