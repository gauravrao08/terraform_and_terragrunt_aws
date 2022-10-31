data "aws_vpc" "my_vpc" {
  tags = {
    Owner       = "gaurav"      ## update VPC tags
    Environment = "dev"
  }
}


## this will pick only private subnet from the VPC subnet, where tag "subnet_type = private"
data "aws_subnets" "subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }
   filter {
    name   = "tag:subnet_type"
    values = ["private"]          ## we are creating RDS subnet group in private subnet, please check tags in VPC
  }
}

###
/*data "aws_subnet" "subnet_name" {
  for_each = data.aws_subnets.subnet_ids.ids
  id       = each.value
}*/



## if you want to give only 2 subnet not all the subnet in subnet group
/*data "aws_subnet" "subnet_a" {
  vpc_id = data.aws_vpc.my_vpc.id
  filter {
    name = "tag:region"
    values = ["vpc-new-dhcp-private-${local.region}a"]
  }
}

data "aws_subnet" "subnet_b" {
  vpc_id = data.aws_vpc.my_vpc.id
  filter {
    name = "tag:region"
    values = ["vpc-new-dhcp-private-${local.region}b"]
  }
}

data "aws_subnet" "subnet_c" {
  vpc_id = data.aws_vpc.my_vpc.id
  filter {
    name = "tag:region"
    values = ["vpc-new-dhcp-private-${local.region}c"]
  }
}*/
