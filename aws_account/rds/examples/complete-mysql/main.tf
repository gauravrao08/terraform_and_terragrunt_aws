locals {
  name   = "complete-mysql"       ## update RDS name
  region = "eu-west-1"          ## update region where you want to create resource
  tags = {
    Owner       = "GAURAV"      ### updated tag related to RDS 
    Environment = "dev"
    Product     = "adidas"
    manage-by = "terraform"     ## don't remove this tag
  }
}

################################################################################
# RDS Module
################################################################################

module "db" {
  source = "../../../../modules/rds/"

  identifier = local.name

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"        ## update engine name
  engine_version       = "8.0.27"       ## update version of engine
  family               = "mysql8.0"     # DB parameter group
  major_engine_version = "8.0"          # DB option group
  instance_class       = "db.m5.large"  ## update instance tyep class

  storage_type          = "gp2"         ## update storage_type gp2 gp3...
  allocated_storage     = 20            ## update storage
  max_allocated_storage = 100           ## if you want to enable storage Autoscaling

  db_name                = "completeMysql"          ## DB name
  username               = "complete_mysql"         ## DB username
  create_random_password = fasle                  ## if you want random password
  password               = "gaurav@123"           ## update password
  port                   = 3306                   ## update DB port

#################################################################
  multi_az = true           ## update true or fasle for multi AZs 
  #availability_zone      = "${local.region}a"   ###if you want single AZ then comment multi_az and use this option 
  ###############################################################
  vpc_security_group_ids = [data.aws_security_group.ec2_sg.id]

  create_db_subnet_group = false               ## always false for future use
  db_subnet_group_name   = data.aws_db_subnet_group.db_subnet_group.id

  maintenance_window = "Mon:00:00-Mon:03:00"        ## update maintenance_window time
  backup_window      = "03:00-06:00"                ## update
  #enabled_cloudwatch_logs_exports = ["general"]    
  create_cloudwatch_log_group = false

  backup_retention_period = 0
  skip_final_snapshot     = true         
  deletion_protection     = false         ## true if you need deletion_protection

  performance_insights_enabled          = false
  performance_insights_retention_period = 7
  create_monitoring_role                = false
  #monitoring_interval                   = 60

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = local.tags
  db_instance_tags = {
    "Sensitive" = "high"          ## update tags
    "gaurav"    = "best"
  }
  db_option_group_tags = {
    "Sensitive" = "low"            ## update tags
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"          ## update tags
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"           ## update tags
  }
}


