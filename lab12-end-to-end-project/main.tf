terraform {

  backend "gcs" {
    bucket = "tf-state-terraform"
    prefix = "lab12"
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

  vm_name = "srilekha-${local.environment}-vm"

  bucket_name = "srilekha-${local.environment}-storage"

  sa_name = "srilekha-${local.environment}-sa"

  subnet_cidr = {
    dev  = "10.20.2.0/24"
    qa   = "10.20.3.0/24"
    prod = "10.20.4.0/24"
  }
}

module "service_account" {

  source = "./modules/service-account"

  account_id = local.sa_name

  display_name = "${local.environment} Service Account"
}
module "bucket" {

  source = "./modules/bucket"

  bucket_name = local.bucket_name
}
module "subnet" {

  source = "./modules/subnet"

  subnet_name = "srilekha-${local.environment}-subnet"

  cidr = local.subnet_cidr[local.environment]
  
  region      = "asia-south1"

  network = "interns-vpc"
}
module "vm" {

  source = "./modules/vm"

  vm_name = local.vm_name

  network    = "interns-vpc"
  subnetwork = module.subnet.subnet_name
}
resource "google_storage_bucket_iam_member" "viewer" {

  bucket = module.bucket.bucket_name

  role = "roles/storage.objectViewer"

  member = "serviceAccount:${module.service_account.email}"
}