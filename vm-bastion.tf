resource "proxmox_virtual_environment_vm" "bastion" {

  name      = "bastion"
  node_name = var.node_name

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 512
  }

  disk {
    datastore_id = var.storage
    size         = 10
    interface    = "scsi0"
  }

  network_device {
    bridge = var.vm_bridge
  }

  initialization {

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "ubuntu"
      keys     = [var.ssh_public_key]
    }

  }

}
