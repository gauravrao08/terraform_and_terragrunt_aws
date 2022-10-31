provider "aws" {
  region = local.region
}

locals {
  region = "eu-west-1"    ### update region in which you want to create resouce
}
