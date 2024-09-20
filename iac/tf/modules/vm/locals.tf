locals {
  vm_size_map = {
    small  = "Standard_B2ts_v2"
    medium = "Standard_B2s"
    large  = "Standard_B2ms"
  }

  selected_vm_size = local.vm_size_map[var.size]

  public_ip_name = "pip-${var.name}"
  nic_name = "nic-main-${var.name}"
  nic_internal_name = "nic-internal-${var.name}"
  subnet_id = var.subnet_info.id
  nsgrule_https_name = "AllowInbound443to${var.name}"
  nsgrule_http_name = "AllowInbound80to${var.name}"
  nsgrule_ssh_name = "AllowInbound22to${var.name}-MyHost"

}