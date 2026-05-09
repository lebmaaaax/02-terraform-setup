output "vm_1_internal_ip" {
  description = "Intr. IP 1 VM."
  value       = yandex_compute_instance.vm_1.network_interface[0].ip_address
}

output "vm_1_external_ip" {
  description = "Extr. IP 1 VM."
  value       = yandex_compute_instance.vm_1.network_interface[0].nat_ip_address
}

output "vm_2_internal_ip" {
  description = "Intr. IP 2 VM."
  value       = yandex_compute_instance.vm_2.network_interface[0].ip_address
}

output "vm_2_external_ip" {
  description = "Extr. IP 2 VM."
  value       = yandex_compute_instance.vm_2.network_interface[0].nat_ip_address
}
