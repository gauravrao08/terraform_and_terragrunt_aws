remote_state {
  backend = "s3"
  config = {
    bucket = "adidas-dev-infrastructure-as-a-code"
    
    key = "adidas/china_region/eu-west-1/dev/aws_id_123445556667788/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    #encrypt        = true
    #dynamodb_table = "my-lock-table"
  }
}
