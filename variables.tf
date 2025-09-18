variable "project" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region (for regional cluster or node pools)"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Primary zone for a zonal cluster (if using zonal)"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  type    = string
  default = "tf-gke-cluster"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "bucket_name" {
  description = "Name of the GCS bucket for Terraform state backup"
  type        = string
}

variable "location" {
  description = "GCP region for the bucket"
  type        = string
  default     = "us-central1"
}
