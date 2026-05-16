terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "0.17.0"
    }
  }
}


provider "iosxe" {
devices = [ {
      name = "R1"
      host = "10.255.1.102"
    },
    { name = "R2"
      host = "10.255.1.103"
    },
    { name = "R3"
      host = "10.255.1.104"
    } ]
    username = "admin"
    password = var.password
    protocol = "restconf"
}
locals {
  router_loopbacks = {
    "R1" = {"111" = "11","112" ="12","113" ="13"}
    "R2" = {"211" = "14","312"="15","313"= "16"}
    "R3" = {"311" = "17","312"="18","313"= "19"}
  }
}

module "loopback" {
    source = "./modules/loopback"
    for_each = local.router_loopbacks
    device_name = each.key
    loopback_nums = each.value
    providers = {
      iosxe = iosxe
    }
  
}