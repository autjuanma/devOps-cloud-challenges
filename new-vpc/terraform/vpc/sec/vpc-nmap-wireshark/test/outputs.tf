output "nmap_container_ip" {
  value = docker_container.nmap.ip_address
}

output "wireshark_container_ip" {
  value = docker_container.wireshark.ip_address
}