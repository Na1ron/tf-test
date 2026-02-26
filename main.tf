data "proxmox_virtual_environment_vms" "template" {

  node_name = var.node_name

  filter {
    name = var.template_name
  }

}
