data "aws_vpc" "myvpc" {
  tags = var.vpc_tags
}

#######################################################################################

module "ipv4_ipv6_example" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group.git"

  name        = var.name     ## update security group name
  description = var.description  ## update security group description
  vpc_id      = data.aws_vpc.myvpc.id
  tags = var.tags

ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
egress_with_cidr_blocks = var.egress_with_cidr_blocks 

/*
#############################################################
#### Ingress role for IPV4 in-bound###############
#########################################################
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "User-service ports (ipv4)"
      cidr_blocks = "192.168.2.0/24"
    },
  ]


#############################################################
#### Ingress role for IPV6 in-bound###############
#########################################################

  ingress_with_ipv6_cidr_blocks = [
    {
      from_port        = 8080
      to_port          = 8090
      protocol         = "tcp"
      description      = "User-service ports (ipv6)"
      ipv6_cidr_blocks = "2001:db8::/64"
    },
  ]


#############################################################
#### Egress role for IPV4 OUT-bound###############
#########################################################
  egress_with_cidr_blocks = [
    {
      from_port   = all
      to_port     = all
      protocol    = "tcp"
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

#############################################################
#### Egress role for IPV6 OUT-bound###############
#########################################################

  egress_with_ipv6_cidr_blocks = [
    {
      from_port        = all
      to_port          = all
      protocol         = "tcp"
      description      = "User-service ports (ipv6)"
      ipv6_cidr_blocks = "2001:db8::/64"
    },
  ]
  
  */  #commend end
}

