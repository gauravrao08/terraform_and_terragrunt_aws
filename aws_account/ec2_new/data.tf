################################################################################
# Supporting Resources
################################################################################

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "tag:Name"
    values = [var.ami_name]     ### update AMI name through you will create Ec2 machine
  }
}

data "aws_vpc" "my_vpc" {
  tags = var.vpc_tags
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = var.subnet_tags
}

data "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = var.secrity_group_tags
}

data "aws_iam_instance_profile" "ec2_profile" {    ## if you want to use already exist IAM ROle and want to attach that role in Ec2 machine
  name = var.iam_role_name  
}