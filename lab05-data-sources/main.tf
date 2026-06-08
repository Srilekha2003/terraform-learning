terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "internal-sandbox-446612"
}

data "google_project" "current" {
  
}
output "project_id" {
  value = data.google_project.current.project_id
}

 output "project_number" {
  value = data.google_project.current.number
 }

 output "project_name" {
    value = data.google_project.current.name
 }