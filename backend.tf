terraform {
  backend "gcs" {
    bucket = "tfbu"       # your bucket name
    prefix = "tfb"        # folder inside the bucket for storing the state
  }
}
