resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("../data/ssh/deployer.pub.key")
}

#
#resource "aws_network_interface" "test_vm_nic1" {
#  subnet_id = aws_subnet.vpc0_subnet.id
#  private_ips = ["10.0.1.10"]
#  #  associate_public_ip_address = true
#  # vpc_security_group_ids = [aws_security_group.ingress-all-test.id]
#  security_groups = [aws_security_group.ingress-all-test.id]
#
#  tags = {
#    Name = "primary_network_interface 1"
#  }
#}
#
#resource "aws_eip" "text_vm_eip" {
#  instance = aws_instance.test_vm.id
#}

#resource "aws_instance" "test_vm" {
#  ami                    = "ami-0c0d3776ef525d5dd"
#  instance_type          = "t2.micro"
#  subnet_id              = aws_subnet.vpc0_subnet.id
#  key_name               = aws_key_pair.deployer.id
#  vpc_security_group_ids = [aws_security_group.ingress-main-test.id]
#  #  associate_public_ip_address = true
#
#
#
#  # network_interface {
#  #   network_interface_id = aws_network_interface.test_vm_nic1.id
#  #  device_index         = 0
#  #}
#
#  credit_specification {
#    cpu_credits = "unlimited"
#  }
#  depends_on = [
#    aws_security_group.ingress-main-test
#  ]
#}
####### work 
#module "vm0" {
#  source               = "../modules/ec2"
#  aws_instance_name    = "vm00"
#  ami                  = "ami-0c0d3776ef525d5dd"
#  instance_type        = "t2.micro"
#  security_groups      = [module.ssh_nsg.id, module.http_nsg.id]
#  subnetID             = aws_subnet.vpc0_subnet.id
#  eip                  = true
#  ssh_key              = aws_key_pair.deployer.id
#  iam_instance_profile = "cloudwatch_policy"
#  #user_data            = file("../data/cloudinit/update.sh")
#  user_data = join("\n", [
#    file("../data/cloudinit/update.sh"),
#    file("../data/cloudinit/httpd.sh"),
#    file("../data/cloudinit/cloudwatch-agent.sh")
#    ]
#  )
#  #user_data = templatefile("../data/cloudinit/httpd.sh",{})  # work
#}

module "vm01" {
  source               = "../modules/ec2"
  aws_instance_name    = "vm01"
  ami                  = "ami-0c0d3776ef525d5dd"
  instance_type        = "t2.micro"
  security_groups      = [module.ssh_nsg.id, module.http_nsg.id]
  subnetID             = aws_subnet.vpc0_subnet1.id
  eip                  = true
  ssh_key              = aws_key_pair.deployer.id
  iam_instance_profile = "cloudwatch_policy"
  user_data = join("\n", [
    file("../data/cloudinit/update.sh"),
    file("../data/cloudinit/httpd.sh"),
    file("../data/cloudinit/cloudwatch-agent.sh")
    ]
  )

}
#######
### Add EBS
#resource "aws_volume_attachment" "ebs_att_vm0" {
#  device_name = "/dev/sdb"
#  volume_id   = aws_ebs_volume.vm0_ebs0.id
#  instance_id = module.vm0.id
##  skip_destroy = true
#}

#resource "aws_ebs_volume" "vm0_ebs0" {
#  availability_zone = local.availability_zone_vpc0
#  size              = 1
#}
### end EBS



