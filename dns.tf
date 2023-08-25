resource "aws_route53_record" "dns_record" {
    for_each = local.dns_record_name
    zone_id = "${var.dns_zone_id != "" ? var.dns_zone_id : "REPLACE_ME"}"
    name    = each.value
    type    = "A"
    ttl     = "300"
    records = ["${var.use_elastic_ip == true ? aws_eip.go_instance_eip[0].public_ip : aws_instance.go_instance.public_ip}"]
}
