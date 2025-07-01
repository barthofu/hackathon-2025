data "terraform_remote_state" "network" {
   backend = "local"

   config = {
     path = "../network/terraform.tfstate"
   }
}

module "config" {
   source = "../../config"  
}

module "mks" {
   source = "../../modules/mks"
   service_name = var.service_name
   
   region = "GRA9"
   private_network_id = data.terraform_remote_state.network.outputs.private_network_id
   subnet_id = data.terraform_remote_state.network.outputs.private_network_subnet_id
   
   project_name = module.config.project_name
}