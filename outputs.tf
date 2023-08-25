output "dns_records" {
  value = [for r in local.dns_record_name: r]
}

output "public_ip" {
  value = "${var.use_elastic_ip == true ? aws_eip.go_instance_eip[0].public_ip : aws_instance.go_instance.public_ip}"
}
