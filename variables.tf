variable "cloud_id" {
  description = "Yandex Cloud ID."
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID."
  type        = string
}

variable "zone" {
  description = "Zone for resources."
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_id" {
  description = "Subnet ID for the VM."
  type        = string
}

variable "image_id" {
  description = "Boot image ID for the VM."
  type        = string
}

variable "platform_id" {
  description = "Compute platform ID."
  type        = string
  default     = "standard-v3"
}

variable "ssh_user" {
  description = "SSH user into VM."
  type        = string
  default     = "admin"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH key."
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "enable_nat" {
  description = "Attach public IPs to the VMs."
  type        = bool
  default     = true
}

variable "vm_1_name" {
  description = "Name of 1 VM."
  type        = string
  default     = "app"
}

variable "vm_1_cores" {
  description = "vCPU for the 1 VM."
  type        = number
  default     = 2
}

variable "vm_1_memory" {
  description = "RAM for the 1 VM."
  type        = number
  default     = 2
}

variable "vm_1_disk_size" {
  description = "Boot disk size for the 1 VM."
  type        = number
  default     = 20
}

variable "vm_2_name" {
  description = "Name of 2 VM."
  type        = string
  default     = "db"
}

variable "vm_2_cores" {
  description = "vCPU for 2 VM."
  type        = number
  default     = 4
}

variable "vm_2_memory" {
  description = "RAM for the 2 VM."
  type        = number
  default     = 4
}

variable "vm_2_disk_size" {
  description = "Boot disk size for 2 VM."
  type        = number
  default     = 20
} 
