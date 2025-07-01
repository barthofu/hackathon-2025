data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}

module "config" {
  source = "../../config"
}

module "database_seafile" {
  source       = "../../modules/database"
  service_name = var.service_name

  region         = "GRA"
  engine         = "mysql"
  engine_version = "8"
  instance_type  = "db1-4"
  plan           = "essential"

  private_network_id = data.terraform_remote_state.network.outputs.private_network_id
  subnet_id          = data.terraform_remote_state.network.outputs.private_network_subnet_id

  project_name = module.config.project_name
}
