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
resource "google_storage_bucket" "bucket" {
  name          = "srilekha-bucket-terraform"
  location      = "ASIA-SOUTH1"
  force_destroy = true
}
resource "google_service_account" "sa" {
  account_id   = "srilekha-sa"
  display_name = "Service Account for Terraform"
}
resource "google_storage_bucket_iam_member" "bucket_iam" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.sa.email}"
}