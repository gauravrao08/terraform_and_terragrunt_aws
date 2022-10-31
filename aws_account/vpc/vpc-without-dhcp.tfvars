region = "eu-central-1"             ## region in which you want to create VPC resource
name = "vpc-already-exist-dhcp"     ## VPC name
cidr = "192.168.0.0/16"             ## VPC CIDR block provied by Network team
azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]                          ## AZs in region
private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]           ## CIDR for private subnet
public_subnets = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]       ## CIDR for public sunet

dhcp_options_id = "dopt-0ed562fb2a3ccb7ab"  ## update DHCP ID from the AWS console

  public_subnet_tags = {
    	createdby = "terraform"           ## Dont remove this tag
      subnet_type = "public"            ## Dont remove this tag
  }

  private_subnet_tags = {
    	createdby = "terraform"           ## dont remove this tag
      subnet_type = "private"           ## Dont remove this tag
  }

  tags = {
    	Owner       = "gaurav"
    	Environment = "dev"               ## add tags
      manage-through = "terraform"        ## dont remove this tag
  }

  vpc_tags = {
    	createby = "vpc-gaurav"         ## add tags
      manage-by = "terraform"         ## dont remove this tag
  }



