output "private_network_id" {
    value = tolist(module.private_network.private_network.regions_attributes[*].openstackid)[0]
}

output "private_network_subnet_id" {
    value = module.private_network.private_network_subnet.id
}