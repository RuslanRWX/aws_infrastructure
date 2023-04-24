# aws_infrastructure
AWS infrastructure


vm.tf - add VMs to the file

example:

module "vm0" {<br>
  source               = "./modules/ec2"<br>
  aws_instance_name    = "vm00"<br>
  ami                  = "ami-0c0d3776ef525d5dd"<br>
  security_groups      = [module.ssh_nsg.id, module.http_nsg.id]<br>
  subnetID             = aws_subnet.vpc0_subnet.id<br>
  eip                  = true<br>
  ssh_key              = aws_key_pair.deployer.id<br>
  iam_instance_profile = "cloudwatch_policy"<br>
}<br>