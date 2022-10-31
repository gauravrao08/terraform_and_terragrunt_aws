provider "aws" {
  region = local.region
}

locals {
  region = var.region    ## update region where you want to create resource
}
