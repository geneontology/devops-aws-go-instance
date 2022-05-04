resource "aws_security_group" "go_instance_sg" {
  vpc_id = var.vpc_id 
  tags   = var.tags

  dynamic "ingress" {
      for_each = var.open_ports

      content {
        from_port   = ingress.value 
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
