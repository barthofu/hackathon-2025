variable service_name {
  type        = string
  description = "The name of the OVH Cloud project service."
}

variable instance_type {
  type        = string
  description = "The type of machine to use for the Kubernetes nodes (e.g., db1-4)."
  default     = "db1-4"
}

variable region {
  type        = string
  description = "The region where the Kubernetes cluster will be deployed."
  default     = "GRA"
}

variable engine {
  type        = string
  description = "The database engine to use (e.g., mongodb, mysql)."
  default     = "mysql"
}

variable engine_version {
  type        = string
  description = "The version of Kubernetes to use for the cluster."
  default     = "8"
}

variable plan {
  type        = string
  description = "The plan for the database."
  default     = "essential"
}

variable private_network_id {
  type        = string
  description = "The ID of the private network to use for the Kubernetes cluster."
  default     = null
}

variable subnet_id {
  type        = string
  description = "The ID of the subnet to use for the Kubernetes nodes."
  default     = null
}

################################################################################
# Meta
################################################################################

variable project_name {
  type        = string
  description = "Name of the application. It will be used to name the resources of this module."
}