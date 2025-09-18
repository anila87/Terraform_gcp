terraform {
  backend "gcs" {
    bucket = "tfbu"      
    prefix = "tfb"        
  }
}
