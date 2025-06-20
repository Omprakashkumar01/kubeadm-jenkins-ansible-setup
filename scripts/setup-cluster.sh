#!/bin/bash

echo "[+] Disabling swap and updating sysctl"
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo modprobe br_netfilter
echo 'net.bridge.bridge-nf-call-iptables = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl --system

echo "[+] Installing Docker"
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker --now

echo "[+] Adding Kubernetes repo"
sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update

echo "[+] Installing kubelet, kubeadm, kubectl"
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

echo "[+] System ready. Use 'kubeadm init' on master node."

