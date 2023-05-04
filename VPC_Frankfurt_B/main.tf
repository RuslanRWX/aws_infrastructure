# Create a VPC
resource "aws_vpc" "vpc0-frankfurt" {
  cidr_block           = "10.1.0.0/20"
  enable_dns_hostnames = true

  tags = {
    Name = "frankfurt-B"
  }
}

resource "random_string" "rds_password" {
  special = false
  length  = 20
}

