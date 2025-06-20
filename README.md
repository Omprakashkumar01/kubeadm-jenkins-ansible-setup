# 🚀 Kubernetes Cluster with Dockerized Jenkins + Ansible (Manual Setup using kubeadm)

This project demonstrates how to manually create a Kubernetes cluster using `kubeadm` and deploy **Jenkins** and **Ansible** inside custom Docker containers running in Kubernetes pods. Jenkins is used as the CI server, while Ansible is used for automated deployment across nodes.

---

## 📌 Project Highlights

- 🔧 Kubernetes cluster manually setup using `kubeadm`
- 🐳 Custom Docker images for Jenkins and Ansible (no prebuilt images used)
- ⚙️ Jenkins deployed as a Kubernetes pod with NodePort access
- 🤖 Ansible deployed as a standalone pod to run infrastructure automation tasks
- 📡 Jenkins triggers Ansible to deploy/update services across nodes
- 🎯 Fully self-contained — no Helm or DockerHub dependencies

---
# ⚙️ Setup Guide
## 1. 🔨 Prepare Nodes
Run the following on all nodes (master and worker):
```
./scripts/setup-cluster.sh
```
## 2. 🚀 Initialize Cluster (on Master)
```
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```
## Follow instructions to set up kubeconfig
## 3. 🔗 Join Worker Nodes
Use the kubeadm join ... command from master on all worker nodes.

## 4. 🌐 Install Calico Network (on Master)
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml
```
## 5. 🛠️ Build Docker Images
```
docker build -t jenkins-custom ./docker/jenkins
docker build -t ansible-custom ./docker/ansible
```

## 6. 📦 Deploy Jenkins & Ansible Pods
```
kubectl apply -f k8s-manifests/jenkins-deployment.yaml
kubectl apply -f k8s-manifests/ansible-pod.yaml
```
## 📡 Access Jenkins UI
Find Jenkins service NodePort:
```
kubectl get svc jenkins-service
```
Open in browser

## 🤖 Running Ansible from Jenkins
Example shell build step in Jenkins:
```
kubectl exec -it ansible-pod -- ansible-playbook /playbooks/deploy.yaml
```
