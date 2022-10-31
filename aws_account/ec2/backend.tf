terraform {
  backend "s3" {
    bucket = "adidas-dev-infrastructure-as-a-code"    ## update bucket name
    key    = "adidas/china_region/eu-west-1/dev/aws_id_287323428084/ec2/ec2-infra.tfstate"   ## update path of tfstate file in bucket
    region = "eu-west-1"        ## bucket region
  }
}

