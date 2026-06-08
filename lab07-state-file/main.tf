terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "internal-sandbox-446612"
  region = "aisa-south1"
}
 
resource "google_storage_bucket" "state_demo" {
  name = "srilekha-state-demo"
  location = "ASIA-SOUTH1"
  force_destroy = true
}
