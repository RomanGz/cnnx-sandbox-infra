resource "google_service_account" "SA_terraform" {
  account_id   = "terraform"
  description  = "terraform service account, uses key"
  disabled     = "false"
  display_name = "terraform"
  }

resource "google_service_account" "SA_secret-accessor" {
  account_id = "secret-accessor"
  disabled   = "false"
  }

resource "google_service_account" "SA_cnnx-sandbox-infra-netops" {
  account_id   = "cnnx-sandbox-infra-netops"
  description  = "API key for NetOps Terraform Sandbox work"
  disabled     = "false"
  display_name = "cnnx-sandbox-infra-netops"
  }

resource "google_service_account" "SA_terraform-cnnx-sandbox-infra" {
  account_id   = "terraform-cnnx-sandbox-infra"
  disabled     = "false"
  display_name = "Terraform Infra Sandbox"
  }

resource "google_service_account" "SA_cnnx-sandbox-infra" {
  account_id   = "cnnx-sandbox-infra"
  disabled     = "false"
  display_name = "App Engine default service account"
  }

resource "google_service_account" "SA_gce-sa" {
  account_id   = "gce-sa"
  description  = "GCE service account"
  disabled     = "false"
  display_name = "gce-sa"
  }


resource "google_service_account" "SA_firebase-adminsdk-3luhi" {
  account_id   = "firebase-adminsdk-3luhi"
  description  = "Firebase Admin SDK Service Agent"
  disabled     = "false"
  display_name = "firebase-adminsdk"
  }
