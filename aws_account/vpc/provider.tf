provider "aws" {
  region = local.region
}

locals {
  region = var.region   ## update default region where aws resource will be created
}
