variable "location" {
  description = "It defines the region where resources will be deployed. Accepted values are: 'westeurope' and 'spaincentral' for this module"
  type = string

  validation {
    condition = contains(["westeurope", "spaincentral"], var.location)
    error_message = "The region must be either 'westeurope' or 'spaincentral'"
  }

  default = "spaincentral"

}

#Mandatory variables
variable "resource_group" {
  description = "It specifies the resource group where virtual network will be deployed. This value is mandatory for this module"
  type = string
}

#configurable variables
variable "vnet_name" {
  description = "Set a name for the new virtual network"
  type = string
  default = "network01"
}
variable "subnet_prefix_name" {
  description = "Set a specific prefix for subnet name for better identification"
  type = string
  default = ""
}
variable "subnet_name" {
  description = "Set a name for the main subnet"
  type = string
  default = "subnet01"
}

variable "vnet_cidr" {
  description = "The CIDR block for the virtual network. Default values is '10.0.0.0/16'"
  type = string
  default = "10.0.0.0/16"
}

variable "nsg_name" {
  description = "Set a name for the new network security group"
  type = string
  default = "nsg"
}

variable "tags" {
  description = "Tags for these network resources"
  type = map
  default = {}
}