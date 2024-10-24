
output "instance_details" {
  value = [
    for idx, instance in google_compute_instance.vm_instance : {
      name       = instance.name
      public_ip  = instance.network_interface[0].access_config[0].nat_ip
      ssh_key    = "keys/maalsi-${idx + 1}.pub"
    }
  ]
  description = "The public IPs, instance names, and SSH key names for the 3 instances"
}

