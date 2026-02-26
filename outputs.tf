output "bastion_vm_id" {

  value = proxmox_virtual_environment_vm.bastion.vm_id

}

output "web_vm_ids" {

  value = proxmox_virtual_environment_vm.web[*].vm_id

}

output "db_vm_id" {

  value = proxmox_virtual_environment_vm.db.vm_id

}
