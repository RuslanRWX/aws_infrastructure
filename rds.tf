#resource "aws_db_instance" "test_mysql" {
#  db_name              = "frankfurtRDSmariadb"
#  identifier           = "test-mysql"
#  instance_class       = "db.t2.micro"
#  engine               = "mariadb"
#  engine_version       = "10.6.12"
#  username             = "root"
#  password             = "rubuntu001912"
#  port                 = 3306
#  allocated_storage    = 20
#  db_subnet_group_name = aws_db_subnet_group.vpc0_subnetDB.id
#  #security_group_names = module.mysql_nsg.name
#  vpc_security_group_ids = [module.mysql_nsg.id]
#  skip_final_snapshot    = true
#  apply_immediately      = true
#  publicly_accessible    = true
#
#}