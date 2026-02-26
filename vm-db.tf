resource "proxmox_virtual_environment_vm" "db" {

  name      = "db-1"
  node_name = var.node_name

  depends_on = [proxmox_virtual_environment_vm.web]

  clone {
    vm_id = local.template_vm_id
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = var.storage
    size         = 20
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
