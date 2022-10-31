terraform {
  backend "s3" {
    bucket = "adidas-dev-infrastructure-as-a-code"    ## update bucket name
    key    = "adidas/china_region/eu-west-1/dev/aws_id_287323428084/db-subnet-gp/db-subnet-gp.tfstate"   ## update path of tfstate file in bucket
    region = "eu-west-1"        ## bucket region
  }
}
