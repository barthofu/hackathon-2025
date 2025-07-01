terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
    }
  }
}

resource "ovh_cloud_project_kube" "default" {
   service_name = var.service_name
   
   name               = "${var.project_name}-kube-cluster"
   region             = var.region
   version            = var.kube_version

   # network
   private_network_id = var.private_network_id
   nodes_subnet_id    = var.subnet_id
   private_network_configuration {
      default_vrack_gateway              = ""
      private_network_routing_as_default = false
   }
}

resource "ovh_cloud_project_kube_nodepool" "default" {
   service_name  = var.service_name
   
   kube_id       = ovh_cloud_project_kube.default.id
   name          = "${var.project_name}-node-pool"
   flavor_name   = var.machine_type
   desired_nodes = var.desired_nodes
   max_nodes     = var.desired_nodes
   min_nodes     = var.desired_nodes
}