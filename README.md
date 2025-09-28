# 🐮 Wisecow: DevOps Trainee Assessment Project

## 📌 Overview

Wisecow is a quirky Bash-based web server that delivers random quotes using `fortune` and `cowsay`. This project containerizes the app, deploys it on Kubernetes, secures it with TLS, and automates CI/CD using GitHub Actions.

---

## 🚀 Features

- 🐳 Dockerized Bash app with cowsay + fortune
- ☸️ Kubernetes deployment with service exposure
- 🔁 GitHub Actions CI/CD pipeline
- 🔐 TLS-secured Ingress
- 🧪 Bash scripts for system and app health checks

---

## 🛠️ Setup Instructions

### 🔹 Prerequisites

To run locally:
```bash
sudo apt install fortune-mod cowsay netcat-traditional -y

# 🔹 Docker Build & Run
docker build -t sachyal/wisecow:latest .
docker run -p 4499:4499 sachyal/wisecow:latest

# 🔹 Kubernetes Deployment
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
---
Access the app via:
http://<minikube-ip>:<node-port>


🔐 TLS Setup
TLS is configured via Ingress using a self-signed certificate or cert-manager. The app is accessible at:
https://wisecow.local
To Test:
curl -k https://wisecow.local

🔁 CI/CD Pipeline
GitHub Actions automatically:

Builds Docker image on push

Pushes to DockerHub

Workflow file
.github/workflows/docker-deploy.yml

Secrets used:

DOCKER_USERNAME

DOCKER_PASSWORD

✅ Link to Repo and DockerHub Image
Add these near the top:

GitHub Repo: [View Repository](https://github.com/sachyal/wisecow)

DockerHub Image: [View Image](https://hub.docker.com/r/sachyal/wisecow)

🧪 Bash Scripts
✅ health_monitor.sh
Monitors CPU, memory, and disk usage. Logs alerts if thresholds exceed.

✅ app_health_check.sh
Checks HTTP status of the app and reports if it's up or down.


📁 Repo Structure
wisecow/
├── Dockerfile
├── wisecow.sh
├── deployment.yaml
├── service.yaml
├── ingress.yaml
├── health_monitor.sh
├── app_health_check.sh
├── violation.png         # (optional)
└── .github/
    └── workflows/
        └── docker-deploy.yml

🛡️ KubeArmor Policy (Optional)
A zero-trust policy was attempted to block access to /etc/shadow. Due to setup issues, this step was skipped.

👥 Access Control
This repository is public. Access has been granted to:

nyrahul

✅ Submission Status
All required components have been implemented and verified:

[x] Dockerization

[x] Kubernetes deployment

[x] CI/CD pipeline

[x] TLS setup

[x] Bash scripts

[ ] KubeArmor policy (optional)

![CI/CD](https://github.com/sachyal/wisecow/actions/workflows/docker-deploy.yml/badge.svg)






