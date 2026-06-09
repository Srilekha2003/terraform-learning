terraform {
  backend "gcs" {
    bucket = "tf-state-terraform"
    prefix = "lab10/workspaces"
  }

  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "internal-sandbox-446612"
  region = "asia-south1"
}

locals {
  environment = terraform.workspace
}

resource "google_storage_bucket" "env_bucket" {
    name = "srilekha-${local.environment}-bucket"
    location = "asia-south1"
    force_destroy = true
}

output "environment" {
  value = local.environment
}

output "bucket_name" {
  value = google_storage_bucket.env_bucket.name

}