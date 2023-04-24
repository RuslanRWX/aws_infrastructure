# aws_infrastructure
AWS infrastructure


vm.tf - add VMs to the file
example:

module "vm0" {
  source               = "./modules/ec2"
  aws_instance_name    = "vm00"
  ami                  = "ami-0c0d3776ef525d5dd"
  security_groups      = [module.ssh_nsg.id, module.http_nsg.id]
  subnetID             = aws_subnet.vpc0_subnet.id
  eip                  = true
  ssh_key              = aws_key_pair.deployer.id
  iam_instance_profile = "cloudwatch_policy"
}