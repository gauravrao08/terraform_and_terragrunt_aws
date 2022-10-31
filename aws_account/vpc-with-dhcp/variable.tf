variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "gaurav-vpc-change-name"
}

variable "region" {
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  #default     = "0.0.0.0/0"
}


variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["GAURAVAdidasDNS"]
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "dhcp_options_tags" {
  description = "Additional tags for the DHCP option set (requires enable_dhcp_options set to true)"
  type        = map(string)
  default     = {}
}


