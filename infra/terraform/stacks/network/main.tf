module "config" {
   source = "../../config"  
}

module "private_network" {
   source = "../../modules/network"
   service_name = var.service_name

   vlan_id = 42
   region = "GRA9"
   
   project_name = module.config.project_name
}