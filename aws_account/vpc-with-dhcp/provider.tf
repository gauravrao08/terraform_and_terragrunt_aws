provider "aws" {
  region = local.region
}

locals {
  region = var.region    ## update region in which resource will be created
}
