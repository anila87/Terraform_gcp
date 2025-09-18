provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance_template" "default" {
  name         = "mig-template"
  machine_type = "e2-medium"

  tags = ["http-server"]

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
   
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl start apache2
    echo "Hello from MIG instance" > /var/www/html/index.html
  EOT
}

resource "google_compute_instance_group_manager" "default" {
  name               = "mig-group"
  base_instance_name = "mig-instance"
  zone               = var.zone
  version {
    instance_template = google_compute_instance_template.default.self_link
  }
  target_size = 1
  auto_healing_policies {
    health_check      = google_compute_health_check.default.self_link
    initial_delay_sec = 300
  }
}


resource "google_compute_health_check" "default" {
  name                = "mig-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
  }
}

resource "google_compute_autoscaler" "default" {
  name   = "mig-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.default.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}


resource "google_storage_bucket" "tfstate_bucket" {
  name          = "tfbu"
  location      = "US"
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "private_access" {
  bucket = google_storage_bucket.tfstate_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "user:anila.gokada.8@gmail.com"
}
