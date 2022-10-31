locals {
  name   = "complete-mysql"
  region = "eu-west-1"
  tags = {
    Owner       = "GAURAV"
    Environment = "dev"
    Product     = "adidas"
  }
}

################################################################################
# RDS Module
################################################################################

module "db" {
  source = "../../../../../../../modules/rds/"

  identifier = local.name

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  #engine_version       = "8.0.27"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.m5.large"

  port                   = 3306
  storage_type          = "gp2"

  snapshot_identifier = data.aws_db_snapshot.db_snapshot.id

  allocated_storage = 20 
  #db_name                = "completeMysql"
  #username               = "complete_mysql"
  create_random_password = false ## if you want random password
  #password = "Gaurav@123456"
  publicly_accessible = false
  multi_az = true
  #availability_zone      = "${local.region}a"   ###if you want single AZ then comment multi_az and use this option 
  vpc_security_group_ids = [data.aws_security_group.ec2_sg.id]

  create_db_subnet_group = false
  db_subnet_group_name   = data.aws_db_subnet_group.db_subnet_group.id

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false


  /*lifecycle {
    ignore_changes = [snapshot_identifier]
  }*/

  tags = local.tags
  db_instance_tags = {
    "Sensitive" = "high"
    "gaurav"    = "best"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}


