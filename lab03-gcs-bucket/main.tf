terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 6.0"
        }
    }
}
provider "google"{
    project = "internal-sandbox-446612"
    region = "asia-south1"
}

resource "google_storage_bucket" "demo"{
    name = "srilekha-lab3-bucket"
    location = "asia-south1"
    force_destroy = true
}