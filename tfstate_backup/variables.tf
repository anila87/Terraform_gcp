variable "bucket_name" {
  description = "Name of the GCS bucket for storing Terraform state"
  type        = string
}

variable "location" {
  description = "Location/region of the GCS bucket"
  type        = string
}

variable "project_id" {
  description = "Project ID where bucket will be created"
  type        = string
}
