ami_name = "test-gaurav"
vpc_tags = {
    Owner       = "gaurav"
    Environment = "dev"  
}
subnet_tags  = {
    region = "vpc-already-exist-dhcp-private-eu-central-1a"
}
secrity_group_tags = {
    Department = "gaurav rao"
    Project    = "yadav" 
}

iam_role_name = "CloudWatchAgentAdminRole"

name = "gaurav-test-ec2-linux"
region = "eu-central-1"
user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"     ## update user-data script 
  EOT

tags = {
    Owner       = "gaurav"        ## update ec2 machine tags
    Environment = "test-ec2"
    manage-by = "terraform"  ###NOTE : dont remove this tags
  }

instance_type = "t2.small"
key_name = "test-key"
associate_public_ip_address = false  ## true or false

root_block_device = [
    {
      encrypted   = true         ### update
      volume_type = "gp2"       ## update
      #throughput  = 200        ## update
      volume_size = 8            ##update
      tags = {
        Name = "my-root-block"      ## update
      }
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"        ## update
      volume_type = "gp3"             ## update
      volume_size = 5                  ## update
      throughput  = 200                ## update
      encrypted   = true                ## update
      #kms_key_id  = aws_kms_key.this.arn  ## not required for future use
    }
  ]