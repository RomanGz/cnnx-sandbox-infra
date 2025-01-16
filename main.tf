terraform {
  backend "gcs" {
    bucket  = "cnx_terraform_states"
    prefix  = "terraform/state"
  }
}
variable "gcp_project" {
  type = string
}

provider "google" {
  project = "${var.gcp_project}"
}

module "project_globals" {
  source = "./project_globals"
  gcp_project = "${var.gcp_project}"
}

module "infrastructure" {
  source = "./infrastructure"
  gcp_project = "${var.gcp_project}"
}
