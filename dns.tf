resource "aws_route53_record" "dns_record" {
    zone_id = var.dns_zone_id
    name    = var.dns_record_name
    type    = "A"
    ttl     = "300"
    records = ["${var.use_elastic_ip == true ? aws_eip.go_instance_eip[0].public_ip : aws_instance.go_instance.public_ip}"]
    count = "${var.dns_record_name != "" ? 1 : 0}"
}
