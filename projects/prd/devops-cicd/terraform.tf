terraform {
  backend "gcs" {
    bucket = "phuc-terraform-gcs-bucket"
    prefix = "state/prd/devops-cicd"
  }
}
