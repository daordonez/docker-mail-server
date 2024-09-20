locals {
  deployment_sufix = "tf"
  vm_name          = "${var.prefix}-${var.docker_host_name}-${local.deployment_sufix}"
  vnet_name        = "${var.prefix}-${var.vnet_name}-${local.deployment_sufix}"
  subnet_name      = "${var.prefix}-${var.subnet_name}-${local.deployment_sufix}"
  nsg_name         = "${var.prefix}-nsg-${local.deployment_sufix}"

  tags = {
    env          = "${var.environment}"
    project_name = "DMS"
  }

}