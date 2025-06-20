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
