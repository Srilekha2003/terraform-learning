terraform {
  required_providers {
    local ={
        source = "hashicorp/local"
    }
  }
}
locals {
  environment = "dev"
}
 resource "local_file" "app" {
    content  = "Hello, ${local.environment} environment!"
    filename = "${path.module}/app.txt"
 }
  resource "local_file" "db" {
    content  = "Database configuration for ${local.environment} environment."
    filename = "${path.module}/db.txt" 
    
  }