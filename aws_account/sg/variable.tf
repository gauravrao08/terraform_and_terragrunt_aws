variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "gaurav-vpc-change-name"
}

variable "description" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "gaurav-vpc-change-name"
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC already exits"
  type        = map(string)
  default     = {}
}

variable "region" {
  type        = string
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}
