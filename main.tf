resource "google_project_service" "container" {
  project = var.project
  service = "container.googleapis.com"
}

resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.primary.name
  location = google_container_cluster.primary.location

  initial_node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = var.node_count
    max_node_count = var.node_count
  }
}

resource "google_storage_bucket" "tfstate_backup" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true  
  versioning {
    enabled = true      
  }

  uniform_bucket_level_access = true
}


resource "google_storage_bucket_iam_member" "private_access" {
  bucket = google_storage_bucket.tfstate_backup.name
  role   = "roles/storage.objectAdmin"
  member = "user:anila.gokada.8@gmail.com"
}
