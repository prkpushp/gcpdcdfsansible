//Create a service account in GCP and prvode acess - I have it as owner for testing
//ENable APIs Compute and cloudresourcemanager


provider "google" {
  credentials = var.credentialPath
  project     = var.project
  region      = var.region
}


resource "google_project_service" "project" {
  project = var.project
  service = "storage.googleapis.com"
}

// Create Bucket
resource "google_storage_bucket" "meta-territory-393217" {
  name         = "meta-territory-393217"
  location     = "US"
  force_destroy = true
}

// Add more resources and configurations as needed
# Importing the existing resources into Terraform state
terraform {
  required_version = ">= 0.12"
}

