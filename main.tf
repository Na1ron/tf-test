data "proxmox_virtual_environment_vms" "all" {
  node_name = var.node_name
}

locals {
  template_vm_ids = [
    for vm in data.proxmox_virtual_environment_vms.all.vms : vm.vm_id
    if vm.name == var.template_name && vm.vm_id != null
  ]

  template_vm_id = length(local.template_vm_ids) > 0 ? local.template_vm_ids[0] : var.template_vm_id
}

check "template_vm_id_resolved" {
  assert {
    condition     = local.template_vm_id != null
    error_message = "Template VM ID for template_name='${var.template_name}' was not resolved. Set var.template_vm_id explicitly or verify the template name/node."
  }
}
