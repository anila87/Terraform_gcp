output "instance_group_manager" {
  value = google_compute_instance_group_manager.default.name  
}


output "autoscaler" {
  value = google_compute_autoscaler.default.name
}
