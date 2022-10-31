locals {
  name   = "gaurav-test-ec2"   ### update ec2 machine name
  region = "eu-west-1"        ## update region in which you need to create ec2 

  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"     ## update user-data script 
  EOT

  tags = {
    Owner       = "gaurav"        ## update ec2 machine tags
    Environment = "test-ec2"
    manage-by = "terraform"  ###NOTE : dont remove this tags
  }
}

################################################################################
# EC2 Module
################################################################################

module "ec2_complete" {
  source = "../../../../../modules/ec2"

  name = local.name

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.small"        `       ## update instance type
  availability_zone           = data.aws_subnet.selected.availability_zone
  subnet_id                   = data.aws_subnet.selected.id
  vpc_security_group_ids      = [data.aws_security_group.ec2_sg.id]
  #placement_group             = aws_placement_group.web.id
  key_name                    = "gaurav-Key"                ## update pem key name
  associate_public_ip_address = false                     ## update to "true" if you need public IP on ec2 machine
  disable_api_stop            = false   
  ########################################  
  ##iam_instance_profile = data.aws_iam_instance_profile.ec2_profile.name   ## un-comment this if you want to use already exist IAM ROLE and attach to ec2 machine
  iam_instance_profile = aws_iam_instance_profile.this.name                 ## un-comment this if you are creating New IAM Role
  ###################################
  # only one of these can be enabled at a time
  
  hibernation = false
  # enclave_options_enabled = true

  #user_data_base64            = base64encode(local.user_data)
  #user_data_replace_on_change = true

  #cpu_core_count       = 2 # default 4
  #cpu_threads_per_core = 1 # default 2

  enable_volume_tags = false
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

  tags = local.tags
}









