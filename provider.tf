provider "google" {
  credentials = file("${path.module}/key.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
}