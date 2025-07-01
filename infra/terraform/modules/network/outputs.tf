output "private_network" {
    value = ovh_cloud_project_network_private.default
}

output "private_network_subnet" {
    value = ovh_cloud_project_network_private_subnet.default
}

output "private_network_gateway" {
    value = ovh_cloud_project_gateway.gateway
}