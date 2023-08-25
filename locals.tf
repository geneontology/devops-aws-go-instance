locals {
  dns_record_name = try(toset([tostring(var.dns_record_name)]), toset(var.dns_record_name))
}
