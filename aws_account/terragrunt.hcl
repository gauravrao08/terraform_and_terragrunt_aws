remote_state {
  backend = "s3"
  config = {
    bucket = "bucket_name_infra_sct_as_code"
    
    key = "puma/region/eu-west-1/dev/aws_id_123445556667788/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    #encrypt        = true
    #dynamodb_table = "my-lock-table"
  }
}
