# Provider block
provider "google" {
  project = var.project
  region  = var.region
}

# Network and subnetwork resources
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

# Instance resource
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = var.zone
  labels = {
        app = "db"
        }
}