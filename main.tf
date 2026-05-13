provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

locals {
  ssh_public_key = trimspace(file(var.ssh_public_key_path))
  ssh_key        = "${var.ssh_user}:${local.ssh_public_key}"
}

resource "yandex_compute_instance" "vm_1" {
  name        = var.vm_1_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.vm_1_cores
    memory = var.vm_1_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.vm_1_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  metadata = {
    ssh-keys  = local.ssh_key
    user-data = templatefile("${path.module}/cloud-init.tftpl", {
      hostname       = var.vm_1_name
      ssh_user       = var.ssh_user
      ssh_public_key = local.ssh_public_key
    })
  }
}

resource "yandex_compute_instance" "vm_2" {
  name        = var.vm_2_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.vm_2_cores
    memory = var.vm_2_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.vm_2_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  metadata = {
    ssh-keys  = local.ssh_key
    user-data = templatefile("${path.module}/cloud-init.tftpl", {
      hostname       = var.vm_2_name
      ssh_user       = var.ssh_user
      ssh_public_key = local.ssh_public_key
    })
  }
}
