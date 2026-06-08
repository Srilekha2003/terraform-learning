terraform {

  backend "gcs" {
    bucket = "tf-state-terraform"
    prefix = "lab08/state"
  }

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

resource "google_storage_bucket" "backend_demo" {
  name          = "srilekha-backend-demo"
  location      = "ASIA-SOUTH1"
  force_destroy = true
}