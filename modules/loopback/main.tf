terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "0.17.0"
    }
  }
}

resource "iosxe_interface_loopback" "loopback" {
    for_each = var.loopback_nums
    device = tostring (var.device_name)
    name = each.key
    description = "looback ${each.key} configued using terraform"
    ipv4_address = "192.168.${each.value}.1"
    ipv4_address_mask = "255.255.255.0"
  
}
locals {
  lb_map = {for n in var.loopback_nums: tostring(n) => n}

}