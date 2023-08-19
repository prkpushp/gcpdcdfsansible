variable "project" {
  description = "Google Cloud project ID"
  default     = "meta-territory-393217"
}

variable "credentialPath" {
    description = "JSON key file of service account"
    default     = "c:/svc-gcptf.json"
}

variable "region" {
    description = "Region of the instances"
    default     = "us-central1"
}