data "aws_vpc" "my_vpc" {
  tags = {
    Owner       = "gaurav"
    Environment = "dev"           ## update tags of VPC
  }
}

data "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = {
    Department = "gaurav rao"
    Project    = "yadav"            ### update tags of security group
  }
}

data "aws_db_subnet_group" "db_subnet_group" {
  name = "gaurav_subnet_group"            ## update db subnet group name already created
}

data "aws_db_snapshot" "db_snapshot" {
  db_snapshot_identifier = "testdb-final-snapshot"          ## update snapshort name
  most_recent            = true
}
