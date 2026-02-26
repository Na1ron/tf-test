resource "proxmox_virtual_environment_vm" "web" {

  count = 2

  name      = "web-${count.index + 1}"
  node_name = var.node_name

  clone {
    vm_id = local.template_vm_id
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = var.storage
    size         = 15
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
