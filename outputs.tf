output "public_ip" {
  value = "${var.use_elastic_ip == true ? aws_eip.go_instance_eip.public_ip : aws_instance.go_instance.public_ip}"
}
