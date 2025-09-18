variable "project" {
  description = "GCP Project ID"
  type        = string
  default = "radiant-arcanum-472209-v6"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "location" {
  description = "GCP bucket location/region"
  type        = string
  default     = "us-central1"
}
