terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "internal-sandbox-446612"
  region  = "asia-south1"
}
 resource "google_project_service" "storage_api" {
   service = "storage.googleapis.com"
 }
 resource "google_storage_bucket" "bucket" {
   name = "srilekha-bucket-terraform"
   location = "ASIA-SOUTH1"
   force_destroy = true
   depends_on = [google_project_service.storage_api]
 }