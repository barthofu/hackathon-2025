variable "service_name" {
  type        = string
  description = "The name of the OVH Cloud project service."
}

variable "region" {
  type        = string
  description = "List of regions where the private network can be created."
  default     = "GRA9"
}

variable "vlan_id" {
  type        = number
  description = "The ID of the VLAN to use for the private network."
  default     = null
}

variable "private_ip_prefix" {
  type        = string
  description = "The private IP prefix to use for the private subnet (e.g: 192.168.168)."
  default     = "192.168.168"
}

################################################################################
# Meta
################################################################################

variable "project_name" {
  type        = string
  description = "Name of the application. It will be used to name the resources of this module."
}