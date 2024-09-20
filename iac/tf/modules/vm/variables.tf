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

variable "vnet_info" {
  description = "Mandatory param to spicfy vnet information where the vm will be attached (internally)"
  type = object({
    id = string
    name = string
  })
}
variable "subnet_info" {
  description = "Mandatory param to spicfy subnet information where the vm will be attached (internally)"
  type = object({
    id = string
    name = string
  })
}

variable "nsg_info" {
  description = "Mandatory param to apply network security rules"
  type = object({
    name = string
    id = string
  })
}

variable "name" {
  description = "Set a name for the new virtual machine"
  type = string
  default = "dockerhost"
}

variable "size" {
  description = "Define a size for the new virtual machine. Accepted values are: 'small' (Standard_B2ts_v2), 'medium' (Standard_B2s), 'large' (Standard_B2ms)"
  type = string
  
  validation {
    condition = contains(["small","medium","large"], var.size)
    error_message = "The size must be either 'small', 'medium', or 'large'."
  }

  default = "small"
}

variable "adminuser" {
  description = "Set a name for the administrator user"
  type = string
  default = "adminotf"
}