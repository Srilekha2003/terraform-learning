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

module "subnet" {

  source = "./modules/subnet"

  subnet_name = "srilekha-subnet"
  cidr        = "10.20.1.0/24"
  region      = "asia-south1"

  network = "interns-vpc"
}

module "vm" {

  source = "./modules/vm"

  vm_name = "srilekha-dev-vm"

  network    = "interns-vpc"
  subnetwork = module.subnet.subnet_name
}

module "test_vm" {
  source = "./modules/vm"
  vm_name = "srilekha-test-vm"
  network = "interns-vpc"
  subnetwork = module.subnet.subnet_name
}

