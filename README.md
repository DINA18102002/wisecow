
# 🐮 Wisecow Application Deployment with Kubernetes and CI/CD

## 📋 Project Overview
This project demonstrates the containerization and deployment of the Wisecow application using Docker and Kubernetes with secure TLS communication. It also includes a CI pipeline implemented using GitHub Actions to automatically build and push Docker images to DockerHub.

The Wisecow application generates random wisdom messages using the `fortune` utility and displays them using `cowsay`.

## 🛠 Technologies Used
- Docker
- Kubernetes (Minikube)
- NGINX Ingress Controller
- TLS (Self-signed certificate)
- GitHub Actions (CI/CD)
- DockerHub

## 🔄 Architecture Flow
```
Developer               │
                        │ git push
                        ▼
GitHub Repository       │
                        ▼
GitHub Actions (CI/CD)  │
                        │ Build Docker Image
                        │ Push Image
                        ▼
Docker Hub              │
                        ▼
Kubernetes Deployment   │
                        ▼
Pods                    │
                        ▼
Service                 │
                        ▼
Ingress Controller      │
                        ▼
TLS Secure Access       │
                        ▼
https://wisecow.local
```

## 📁 Project Structure

```
wisecow
│
├── Dockerfile
├── wisecow.sh
│
├── k8s
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
│
├── .github
│   └── workflows
│       └── ci-cd.yml
│
└── README.md
```

## 🐳 Dockerization
Build Docker Image

```bash
docker build -t wisecow .
```

Run Container

```bash
docker run -p 4499:4499 wisecow
```

## ☸️ Kubernetes Deployment
Start Minikube

```bash
minikube start
```

Apply Kubernetes Manifests

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

Verify Deployment

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

## 🔐 TLS Setup
A self-signed TLS certificate was created and stored as a Kubernetes secret.

```bash
kubectl create secret tls wisecow-tls \
  --cert=tls.crt \
  --key=tls.key
```

This enables secure HTTPS communication through the Ingress controller.

## 🌐 Access the Application
Add the following entry to your hosts file:

```
127.0.0.1 wisecow.local
```

Start the Minikube tunnel:

```bash
minikube tunnel
```

Access the application:

```
https://wisecow.local
```

## 📺 Example Output
```
You are a bundle of energy, always on the go.

        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## 🔄 CI/CD Pipeline
CI/CD is implemented using GitHub Actions.

The pipeline automatically:

- Builds the Docker image
- Pushes the image to DockerHub

Workflow file:

```
.github/workflows/ci-cd.yml
```

The pipeline is triggered automatically when code is pushed to the `main` branch.

## 📦 DockerHub Image
The Docker image is published at:

```
https://hub.docker.com/r/theena18/wisecow
```

## ⚠️ Continuous Deployment Note
Continuous deployment to Kubernetes from GitHub Actions was not fully automated because the Kubernetes cluster is running locally using Minikube.

In production environments this would typically be implemented using:

- Cloud Kubernetes clusters (EKS / GKE / AKS)
- GitOps tools like ArgoCD

## ✅ Conclusion
This project demonstrates:

- Containerization using Docker
- Kubernetes deployment and service exposure
- Secure TLS communication via Ingress
- CI/CD automation using GitHub Actions
- Image publishing to DockerHub