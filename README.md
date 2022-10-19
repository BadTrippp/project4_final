<include a CircleCI status badge, here>

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment


* Create EC2 instance or using Centos 7 on Virtual Box
* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 

```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```

* INSTALL NECESSARY TOOLS  
```bash

sudo yum update -y

#INSTALL GIT

sudo yum install git -y

#Check git 

git version

#INSTALL DOCKER

sudo yum install docker

#Enable docker service at boot time

sudo systemctl enable docker.service

#Start Docker service

sudo systemctl start docker.service

#INSTALL MINIKUBE

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
sudo chmod +x minikube 
sudo mv minikube /usr/local/bin/

#Check minikube version

minikube version

#Install Hadolint

sudo wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
sudo chmod +x ./hadolint
sudo mv ./hadolint /usr/local/bin/hadolint
```

* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Docker Steps

* Complete Dockerfile

```bash
FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
#hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
```

* Complete run_docker.sh
```bash
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
# docker logs project4 -f >> docker_out.txt 
```



### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
