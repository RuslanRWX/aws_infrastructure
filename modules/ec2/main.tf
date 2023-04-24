
resource "aws_eip" "vm_eip" {
  count    = var.eip != "" ? 1 : 0
  instance = aws_instance.vm.id
}

resource "aws_instance" "vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnetID
  key_name               = var.ssh_key
  vpc_security_group_ids = var.security_groups
  iam_instance_profile   = var.iam_instance_profile
  user_data              = var.user_data
  #  associate_public_ip_address = true



  # network_interface {
  #   network_interface_id = aws_network_interface.test_vm_nic1.id
  #  device_index         = 0
  #}

  tags = {
    Name = var.aws_instance_name
    Type = "ec2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
