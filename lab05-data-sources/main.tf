terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    local = {
      source = "hashicorp/local"
    }
  }
}

provider "google" {
  project = "internal-sandbox-446612"
}

data "google_project" "current" {
  project_id = "internal-sandbox-446612"
}

resource "local_file" "project_info" {

  filename = "${path.module}/project.txt"

  content = <<EOF
Project ID: ${data.google_project.current.project_id}
Project Name: ${data.google_project.current.name}
Project Number: ${data.google_project.current.number}
EOF
}

output "project_name" {
  value = data.google_project.current.name
}