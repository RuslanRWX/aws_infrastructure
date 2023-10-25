
# Network Security Groups


module "main_nsg" {
  source         = "../modules/nsg"
  name           = "main_nsg"
  incoming_ports = [22, 80, 443]
  outgoing_ports = [0]
  vpcID          = aws_vpc.vpc0-frankfurt.id
  #    protocol = "TCP"
}

module "ssh_nsg" {
  source         = "../modules/nsg"
  name           = "ssh_nsg"
  incoming_ports = [22]
  outgoing_ports = [0]
  vpcID          = aws_vpc.vpc0-frankfurt.id
  #    protocol = "TCP"
}

module "http_nsg" {
  source         = "../modules/nsg"
  name           = "http_nsg"
  incoming_ports = [80, 443]
  outgoing_ports = [0]
  vpcID          = aws_vpc.vpc0-frankfurt.id
  #    protocol = "TCP"
}

module "mysql_nsg" {
  source         = "../modules/nsg"
  name           = "mysql_nsg"
  incoming_ports = [3306]
  outgoing_ports = [0]
  vpcID          = aws_vpc.vpc0-frankfurt.id
  #    protocol = "TCP"
}