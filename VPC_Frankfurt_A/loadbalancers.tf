

#resource "aws_eip" "lb_eip" {
#  instance = aws_lb.main_lb.id
#}

#resource "aws_lb" "main_lb" {
#  name               = "mainlb"
#  load_balancer_type = "network"
#  security_groups    = [module.http_nsg.id]

#  subnet_mapping {
#    subnet_id     = aws_subnet.vpc0_subnet.id
#    allocation_id = aws_eip.lb_eip.id
#  }

#}