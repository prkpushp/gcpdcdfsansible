//Create a service account in GCP and prvode acess - I have it as owner for testing

provider "google" {
  credentials = "c:/svc-gcptf.json"
  project     = "central-eon-386920"
  region      = "us-central1"
}

// Create Bucket
resource "google_storage_bucket" "central_eon_386920" {
  name         = "central-eon-386"
  location     = "US"
  force_destroy = true
}

// Add more resources and configurations as needed
# Importing the existing resources into Terraform state
terraform {
  required_version = ">= 0.12"
}

