output "public_ip" {
  value = aws_eip.go_instance_eip.public_ip
}
