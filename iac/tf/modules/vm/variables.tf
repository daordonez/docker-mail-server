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