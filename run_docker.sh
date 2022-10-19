#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
echo "========= CLEAR OLD ENVIRONMENT ========="
docker stop project4
docker rm project4
docker rmi project4
echo "========= DONE ========="
echo "." 
echo "."
echo "."
echo "========= BUILD NEW IMAGE ========="
docker build --tag=project4 .
echo "========= DONE ========="
echo "." 
echo "."
echo "."
# Step 2: 
# List docker images
echo "========= LIST IMAGES ========="
docker image ls
echo "========= DONE ========="
echo "." 
echo "."
echo "."
# Step 3: 
# Run flask app
echo "========= START ========="
docker run --name project4 -dp 8000:80 project4 
echo "========= DONE ========="
 docker logs project4 -f >> ./output_txt_files/docker_out.txt 