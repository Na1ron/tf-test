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

variable "template_vm_id" {
  type        = number
  default     = null
  nullable    = true
  description = "Optional explicit template VM ID fallback when lookup by template_name does not return vm_id."
}

variable "vm_bridge" {
  type    = string
  default = "vmbr0"
}

variable "ssh_public_key" {
  type = string
}
