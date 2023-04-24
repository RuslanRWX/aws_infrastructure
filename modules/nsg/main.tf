

resource "aws_security_group" "main" {
  name   = var.name
  vpc_id = var.vpcID

  dynamic "ingress" {
    iterator = port
    for_each = var.incoming_ports

    content {
      cidr_blocks = var.cidr
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol
    }
  }
  # Terraform removes the default rule
  dynamic "egress" {
    iterator = port
    for_each = var.outgoing_ports
    content {

      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = var.cidr
    }
  }
}