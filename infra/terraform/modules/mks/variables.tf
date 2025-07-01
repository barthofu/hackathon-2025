variable "service_name" {
  type        = string
  description = "The name of the OVH Cloud project service."
}

variable "machine_type" {
  type        = string
  description = "The type of machine to use for the Kubernetes nodes (e.g., b2-7)."
  default     = "b2-7"
}

variable "region" {
  type        = string
  description = "The region where the Kubernetes cluster will be deployed."
  default     = "GRA9"
}

variable kube_version {
  type        = string
  description = "The version of Kubernetes to use for the cluster."
  default     = "1.32"
}

variable desired_nodes {
  type        = number
  description = "The desired number of nodes in the Kubernetes cluster."
  default     = 3
}

variable "private_network_id" {
  type        = string
  description = "The ID of the private network to use for the Kubernetes cluster."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to use for the Kubernetes nodes."
  default     = null
}

################################################################################
# Meta
################################################################################

variable "project_name" {
  type        = string
  description = "Name of the application. It will be used to name the resources of this module."
}