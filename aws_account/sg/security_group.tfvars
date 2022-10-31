name = "gaurav-sg"    ## name of security group
description = "Gaurav rao secrity group name"   # description o security group
region = "eu-central-1"           ## Region of security group
tags = {
    Department = "gaurav rao"
    Project    = "yadav"        ## update tags of security group
    manage-by = "terraform"      ## NOTE :: dont remove this tags ####
  }

vpc_tags ={
    Owner       = "gaurav"      ## these are tags of VPC
    Environment = "dev"         ## update tags these tags should match with your VPC tags in which you need to create Security Group
  }

##############################################
## Ingress in-bound entry
##############################################
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

##############################################
## Egress out-bound entry
##############################################
  egress_with_cidr_blocks = [
    {
      from_port   = 0               ## to open all the port 
      to_port     = 65535           ## to open all the port 
      protocol    = -1              ## to open all the port 
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
  ]