variable "prefix" {
  description = "Set a prefix deployment for all the resources of this module"
  type        = string
  default     = "dms"
}
variable "location" {
  description = "It defines the region where resources will be deployed. Accepted values are: 'westeurope' and 'spaincentral' for this module"
  type        = string

  validation {
    condition     = contains(["westeurope", "spaincentral"], var.location)
    error_message = "The region must be either 'westeurope' or 'spaincentral'"
  }

  default = "spaincentral"
}

variable "environment" {
  description = "It defines the deployment environment. Accpet values are: 'dev' or 'prod'"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Bad deployment environment. Please, specify 'dev' for development, or 'prod' for production"
  }

  default = "dev"
}

#Mandatory variables
variable "resource_group" {
  description = "It specifies the resource group where virtual network will be deployed. This value is mandatory for this module"
  type        = string
}

variable "vnet_name" {
  description = "Specify a name for the vnet of the deployment"
  type        = string
  default     = "vnet"
}

variable "subnet_name" {
  description = "Specify a name for the main subnet of the deployment"
  type        = string
  default     = "subnet01"
}

variable "docker_host_name" {
  description = "Set a name for the vm which runs the Docker service."
  type        = string
  default     = "dockerhost"
}