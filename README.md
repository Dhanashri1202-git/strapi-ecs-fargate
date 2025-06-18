# 🚀 Strapi Deployment on AWS ECS Fargate using Terraform & GitHub Actions

This project demonstrates how to deploy a Strapi application using **Docker**, **Terraform**, **ECS Fargate**, and automate it with **GitHub Actions**.

---

## 🛠️ Tech Stack

- **Strapi** (Headless CMS)
- **Docker** (Containerization)
- **Amazon ECS (Fargate)** (Container Orchestration)
- **Application Load Balancer (ALB)** (Traffic Routing)
- **CloudWatch Logs** (Monitoring)
- **Terraform** (Infrastructure as Code)
- **GitHub Actions** (CI/CD)

---

## 📁 Project Structure

```bash
.
├── terraform/                  # All Terraform configuration files
│   ├── alb.tf
│   ├── cloudwatch.tf
│   ├── ecs-cluster.tf
│   ├── iam.tf
│   ├── network.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── security.tf
│   ├── task-definition.tf
│   └── variables.tf
│
├── strapi/                     # Strapi app with Dockerfile
│   ├── Dockerfile
│   ├── package.json
│   └── ...
│
├── .github/workflows/
│   └── deploy.yml              # GitHub Actions CI/CD workflow
├── README.md




🚀 Deployment Steps

✅ 1. Pre-requisites

Docker image pushed to Docker Hub.

AWS IAM user with programmatic access.

GitHub repository secrets set:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

DOCKER_USERNAME

DOCKER_PASSWORD

✅ 2. Deploy Infrastructure Manually (Optional)

cd terraform
terraform init
terraform apply -auto-approve

✅ 3. Push to GitHub

Pushing code to main triggers the workflow to:

Build and push Docker image to Docker Hub.

Deploy/update infrastructure via Terraform.

🌐 Access

 Once deployed, your Strapi app will be available at the public ALB DNS (e.g.):


http://strapi-ecs-alb-xxxxxxxx.eu-north-1.elb.amazonaws.com
