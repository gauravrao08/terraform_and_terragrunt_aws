variable "tags" {
  description = "A mapping of tags to assign to subnet_tags"
  type        = map(string)
  default     = {}
}


variable "subnet_tags" {
  description = "A mapping of tags to assign to subnet_tags"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC already exits"
  type        = map(string)
  default     = {}
}

variable "secrity_group_tags" {
  description = "Additional tags for the secrity_group_tags"
  type        = map(string)
  default     = {}
}

variable "region" {
  type        = string
}

variable "iam_role_name" {
  type        = string
}

variable "ami_name" {
  type        = string
}

variable "name" {
  type        = string
}

variable "user_data" {
  type        = string
}


variable "instance_type" {
  type        = string
}

variable "key_name" {
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}