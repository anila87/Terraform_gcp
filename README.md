# Terraform_gcp
The following repository includes Iac using Terraform hosted on GCP
GCP Regional Managed Instance Group with Autohealing & Autoscaling

This Terraform project provisions a Regional Managed Instance Group (MIG) in Google Cloud Platform with autohealing and CPU-based autoscaling. Key features include:

Instance Template: Defines VM configuration, including machine type, boot disk, network, and a startup script that installs NGINX.

Regional MIG: Distributes instances across multiple zones for high availability.

Autohealing: Automatically recreates unhealthy instances based on a health check.

Health Check: Monitors instance health via the /healthz HTTP endpoint.

Autoscaler: Dynamically adjusts the number of instances according to CPU utilization for optimal performance and cost efficiency.

Setup Instructions

To set up this project, first configure the necessary variables such as GCP project ID, region, zones, machine type, and startup script. Then, initialize Terraform to prepare the working environment, review the planned changes, and apply the configuration to create the resources. Once deployed, the instance template, regional MIG, health check, and autoscaler will be active. You can verify deployment through the GCP Console by checking the status of the managed instances and observing the autohealing and autoscaling behavior.
