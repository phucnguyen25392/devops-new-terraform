terraform {
  backend "gcs" {
    bucket  = "phuc-terraform-gcs-bucket"
    prefix  = "state/devops-iam"
  }
}