data "proxmox_virtual_environment_vms" "all" {
  node_name = var.node_name
}

locals {
  template_vm_id = one([
    for vm in data.proxmox_virtual_environment_vms.all.vms : vm.vm_id
    if vm.name == var.template_name
  ])
}
