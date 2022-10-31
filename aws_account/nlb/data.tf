data "aws_vpc" "my_vpc" {
  tags = {
    Owner       = "gaurav"
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
    values = ["public"]
  }
}

resource "aws_eip" "eip_ip" {
  count = length(data.aws_subnets.subnet_ids.ids)
  vpc = true
}