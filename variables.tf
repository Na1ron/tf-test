variable "proxmox_endpoint" {
  type = string
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}

variable "node_name" {
  type    = string
  default = "prox-lab"
}

variable "storage" {
  type    = string
  default = "local-lvm"
}

variable "template_name" {
  type = string
}

variable "vm_bridge" {
  type    = string
  default = "vmbr0"
}

variable "ssh_public_key" {
  type = string
}
