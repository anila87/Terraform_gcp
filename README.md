# GKE Creation via Terraform
This repository demonstrates how to provision a Google Kubernetes Engine (GKE) cluster using Terraform and deploy a simple Nginx application on it. It covers the full workflow from creating a 2-node cluster to deploying the application and exposing it externally with a LoadBalancer service. This setup is ideal for learning GKE, Terraform, and basic Kubernetes deployment concepts.

Key Highlights:

Create a GKE cluster with Terraform.

Configure a separate node pool with 2 nodes.

Deploy Nginx using a Kubernetes Deployment.

Expose Nginx externally via LoadBalancer service.

Quick methods to update index.html inside pods.

Demonstrates ephemeral pod behavior and best practices (ConfigMap or custom image recommended for persistent changes).
