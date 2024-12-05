variable "gcp_project" {}

resource "google_project_iam_member" "SA_service-586297976905--gcp-sa-cloudasset--cloudasset_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcp-sa-cloudasset.iam.gserviceaccount.com"
  role = "roles/cloudasset.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--gcp-sa-cloudbuild--cloudbuild_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  role = "roles/cloudbuild.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--gcf-admin-robot--cloudfunctions_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcf-admin-robot.iam.gserviceaccount.com"
  role = "roles/cloudfunctions.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--gcp-sa-cloudscheduler--cloudscheduler_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcp-sa-cloudscheduler.iam.gserviceaccount.com"
  role = "roles/cloudscheduler.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_secret-accessor--cnnx-sandbox-infra--cloudsql_client" {
  member = "serviceAccount:secret-accessor@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/cloudsql.client"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--containerregistry--containerregistry_ServiceAgent" {
  member = "serviceAccount:service-586297976905@containerregistry.iam.gserviceaccount.com"
  role = "roles/containerregistry.ServiceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--dataflow_admin" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/dataflow.admin"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--dataflow-service-producer-prod--dataflow_serviceAgent" {
  member = "serviceAccount:service-586297976905@dataflow-service-producer-prod.iam.gserviceaccount.com"
  role = "roles/dataflow.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--dataflow_worker" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/dataflow.worker"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--gcp-sa-datamigration--datamigration_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcp-sa-datamigration.iam.gserviceaccount.com"
  role = "roles/datamigration.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--dataproc-accounts--dataproc_serviceAgent" {
  member = "serviceAccount:service-586297976905@dataproc-accounts.iam.gserviceaccount.com"
  role = "roles/dataproc.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_586297976905--cloudservices_gserviceaccount_--editor" {
  member = "serviceAccount:586297976905@cloudservices.gserviceaccount.com"
  role = "roles/editor"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_cnnx-sandbox-infra-netops--cnnx-sandbox-infra--editor" {
  member = "serviceAccount:cnnx-sandbox-infra-netops@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/editor"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_terraform-cnnx-sandbox-infra--cnnx-sandbox-infra--editor" {
  member = "serviceAccount:terraform-cnnx-sandbox-infra@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/editor"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_terraform--cnnx-sandbox-infra--editor" {
  member = "serviceAccount:terraform@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/editor"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_firebase-service-account--firebase-sa-management--firebase_managementServiceAgent" {
  member = "serviceAccount:firebase-service-account@firebase-sa-management.iam.gserviceaccount.com"
  role = "roles/firebase.managementServiceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_firebase-adminsdk-3luhi--cnnx-sandbox-infra--firebase_sdkAdminServiceAgent" {
  member = "serviceAccount:firebase-adminsdk-3luhi@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/firebase.sdkAdminServiceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--firebase-rules--firebaserules_system" {
  member = "serviceAccount:service-586297976905@firebase-rules.iam.gserviceaccount.com"
  role = "roles/firebaserules.system"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--gcp-sa-firestore--firestore_serviceAgent" {
  member = "serviceAccount:service-586297976905@gcp-sa-firestore.iam.gserviceaccount.com"
  role = "roles/firestore.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_firebase-adminsdk-3luhi--cnnx-sandbox-infra--iam_serviceAccountTokenCreator" {
  member = "serviceAccount:firebase-adminsdk-3luhi@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/iam.serviceAccountTokenCreator"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--logging_logWriter" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/logging.logWriter"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--monitoring_metricWriter" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/monitoring.metricWriter"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--monitoring_viewer" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/monitoring.viewer"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_p586297976905-194283--gcp-sa-logging--pubsub_publisher" {
  member = "serviceAccount:p586297976905-194283@gcp-sa-logging.iam.gserviceaccount.com"
  role = "roles/pubsub.publisher"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_dns-updater--cnnx-infra-admin--pubsub_subscriber" {
  member = "serviceAccount:dns-updater@cnnx-infra-admin.iam.gserviceaccount.com"
  role = "roles/pubsub.subscriber"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_service-586297976905--service-networking--servicenetworking_serviceAgent" {
  member = "serviceAccount:service-586297976905@service-networking.iam.gserviceaccount.com"
  role = "roles/servicenetworking.serviceAgent"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_terraform-cnnx-sandbox-infra--cnnx-sandbox-infra--storage_admin" {
  member = "serviceAccount:terraform-cnnx-sandbox-infra@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/storage.admin"
  project = "${var.gcp_project}"
}

resource "google_project_iam_member" "SA_gce-sa--cnnx-sandbox-infra--storage_objectAdmin" {
  member = "serviceAccount:gce-sa@cnnx-sandbox-infra.iam.gserviceaccount.com"
  role = "roles/storage.objectAdmin"
  project = "${var.gcp_project}"
}

