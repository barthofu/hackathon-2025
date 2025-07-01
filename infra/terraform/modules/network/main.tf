terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
    }
  }
}

resource "ovh_cloud_project_network_private" "default" {
  service_name = var.service_name

  name         = "${var.project_name}-private-network"
  vlan_id      = var.vlan_id
  regions      = [var.region]
}

resource "ovh_cloud_project_network_private_subnet" "default" {
  service_name = var.service_name
  network_id   = ovh_cloud_project_network_private.default.id

  region     = var.region
  start      = "${var.private_ip_prefix}.100"
  end        = "${var.private_ip_prefix}.200"
  network    = "${var.private_ip_prefix}.0/24"
  dhcp       = true
  no_gateway = false
}

resource "ovh_cloud_project_gateway" "gateway" {
  service_name = var.service_name
  name       = "gateway"
  model      = "s"
  region     = var.region
  network_id = tolist(ovh_cloud_project_network_private.default.regions_attributes[*].openstackid)[0]
  subnet_id  = ovh_cloud_project_network_private_subnet.default.id
}