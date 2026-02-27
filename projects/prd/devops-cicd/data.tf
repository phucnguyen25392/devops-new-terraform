data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "phuc-terraform-gcs-bucket"
    prefix = "state/prd/devops-network"
  }
}
