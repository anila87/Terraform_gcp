terraform {
  backend "gcs" {
    bucket = "my-tfstate-backup-bucket"   
    prefix = "terraform/state"           
  }
}
