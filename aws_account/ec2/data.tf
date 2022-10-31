################################################################################
# Supporting Resources
################################################################################

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "tag:Name"
    values = ["ADLinux-AMI"]     ### update AMI name through you will create Ec2 machine
  }
}

data "aws_vpc" "my_vpc" {
  tags = {
    Owner       = "gaurav"      ## these are VPC tags, update them sam as VPC
    Environment = "dev"         ## 
  }
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = {
    region = "vpc-new-dhcp-private-eu-west-1a"      ## update region tags of subnet in which you will create Ec2 machine
  }
}

data "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.my_vpc.id
  tags = {
    Department = "gaurav rao"       ## update security group tags
    Project    = "yadav"
  }
}


/*data "aws_iam_instance_profile" "ec2_profile" {    ## if you want to use already exist IAM ROle and want to attach that role in Ec2 machine
  name = "CloudWatchAgentAdminRole"
}*/