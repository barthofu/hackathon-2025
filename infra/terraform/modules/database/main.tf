terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
    }
  }
}

resource "ovh_cloud_project_database" "default" {
  service_name  = var.service_name

  description   = "${var.project_name} ${var.engine} database"
  engine        = var.engine
  version       = var.engine_version
  plan          = var.plan
  flavor        = var.instance_type
  
  nodes {
    region      = var.region
    network_id  = var.private_network_id
    subnet_id   = var.subnet_id
  }
}