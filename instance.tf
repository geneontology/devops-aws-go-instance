resource "aws_instance" "go_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.go_instance_sg.id]
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.ssh_key.key_name
  tags                   = var.tags

  ebs_block_device {
    device_name           = "/dev/sda1"
    delete_on_termination = true
    tags                  = var.tags
    volume_size           = var.disk_size
  }

  lifecycle {
    ignore_changes = [
      ebs_block_device,
      tags,
    ]
  }
}

resource "aws_eip" "go_instance_eip" {
  vpc   = true
  tags  = var.tags
  count = "${var.use_elastic_ip == true ? 1 : 0}"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.go_instance.id
  allocation_id = aws_eip.go_instance_eip.id
  count = "${var.use_elastic_ip == true ? 1 : 0}"
}
