data "aws_vpc" "my_vpc" {
  tags = {
    Owner       = "gaurav"   ###VPC tag name
    Environment = "dev"
  }
}

data "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = {
    Department = "gaurav rao"     ## security group tag name
    Project    = "yadav"
  }
}

data "aws_db_subnet_group" "db_subnet_group" {
  name = "simple-vpc-gaurav"          ## DB subnet group name 
}

