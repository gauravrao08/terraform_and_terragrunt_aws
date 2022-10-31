module "vpc" {
  source = "../../../../../modules/vpc"

  name             = var.name ## Update Name of VPC
  cidr             = var.cidr   ## Update CIDR block of VPC
  azs              = var.azs   ## update all the AZs in same way, if particular AZs is not remove that
  private_subnets  = var.private_subnets         ## update CIDR range for private subnet
  public_subnets   = var.public_subnets   ## update CIDR for public subnet
  #database_subnets = ["192.168.21.0/24", "192.168.22.0/24", "192.168.23.0/24"]   ## if you are creating 3-tier arch then enable this database subnet for RDS where internet is not required

  enable_ipv6                  = false   ## Update to "true" if need ipv6
  #create_database_subnet_group = false ## if want to create database subnet with VPC, otherwise you can create database subnet with RDS
  enable_nat_gateway           = true   ## always true, if you need local entry in your route table
  single_nat_gateway           = true     ## always true, if you need NAT-gateway for private subnet

########################################################
  enable_dhcp_options              = false
 /* dhcp_options_domain_name         = var.dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.dhcp_options_domain_name_servers
  dhcp_options_ntp_servers = 
  dhcp_options_netbios_name_servers =
  dhcp_options_netbios_node_type = */
  
  dhcp_options_tags = var.dhcp_options_tags
  
#####################################################################
## NOTE :: Don't Remove tag which contain key or value as "terraform"
#####################################################################
  public_subnet_tags = var.public_subnet_tags

  private_subnet_tags = var.private_subnet_tags

  tags = var.tags

  vpc_tags = var.vpc_tags

  /*database_subnet_tags = {
    	db_subnet = "vpc-gaurav-subnet"     ## add tags
      manage-by = "terraform"
  }*/

  /*database_subnet_group_tags = {
  	createdby = "subnet-net-gaurav"       ## add tags
    manage-by = "terraform"
  }*/

}

module "dhcp_enable" {
  source = "../../../../../modules/dhcp_vpc"
  vpc_id = module.vpc.vpc_id
  dhcp_id = data.aws_vpc_dhcp_options.dhcp_name.id
}

