
### subnets
resource "aws_subnet" "vpc0_subnet" {
  vpc_id            = aws_vpc.vpc0-frankfurt.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = local.availability_zone_vpc0

  tags = {
    Name = "vpc0_subnet0"
  }
}

resource "aws_subnet" "vpc0_subnet1" {
  vpc_id            = aws_vpc.vpc0-frankfurt.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = local.availability_zone_vpc0

  tags = {
    Name = "vpc0_subnet3"
  }
}

resource "aws_subnet" "vpc0_subnet_rds0" {
  vpc_id            = aws_vpc.vpc0-frankfurt.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.availability_zone_vpc0

  tags = {
    Name = "vpc0_subnet_DB"
  }
}
resource "aws_subnet" "vpc0_subnet_rds1" {
  vpc_id            = aws_vpc.vpc0-frankfurt.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.availability_zone_b_vpc0

  tags = {
    Name = "vpc0_subnet_DB"
  }
}

resource "aws_db_subnet_group" "vpc0_subnetDB" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.vpc0_subnet_rds0.id, aws_subnet.vpc0_subnet_rds1.id]

  tags = {
    Name = "DB_subnet_group"
  }
}

### route association
resource "aws_route_table_association" "vpc0_ass" {
  subnet_id      = aws_subnet.vpc0_subnet.id
  route_table_id = aws_route_table.vpc0-frankfurt.id
}

resource "aws_route_table_association" "vpc0_ass1" {
  subnet_id      = aws_subnet.vpc0_subnet1.id
  route_table_id = aws_route_table.vpc0-frankfurt.id
}

resource "aws_route_table_association" "vpc0_db0" {
  subnet_id      = aws_subnet.vpc0_subnet_rds0.id
  route_table_id = aws_route_table.vpc0-frankfurt-db-subnets.id
}

resource "aws_route_table_association" "vpc0_db1" {
  subnet_id      = aws_subnet.vpc0_subnet_rds1.id
  route_table_id = aws_route_table.vpc0-frankfurt-db-subnets.id
}

### Internet Gateway
resource "aws_internet_gateway" "gw_main" {
  vpc_id = aws_vpc.vpc0-frankfurt.id

  tags = {
    Name = "main"
  }
}


### Route tables
### Main route table
resource "aws_route_table" "vpc0-frankfurt" {
  vpc_id = aws_vpc.vpc0-frankfurt.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_main.id
  }

  tags = {
    Name = "Internet URT"
  }
}

### Route tables DB subnets
resource "aws_route_table" "vpc0-frankfurt-db-subnets" {
  vpc_id = aws_vpc.vpc0-frankfurt.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_main.id
  }

  tags = {
    Name = "RDS route table"
  }
}
