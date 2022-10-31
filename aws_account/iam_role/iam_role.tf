## second file
###################################
resource "aws_iam_role" "this_role" {
  name                 = "rolename"

  assume_role_policy = jsonencode(
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "ec2.amazonaws.com"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        } 
  )

  tags = {
    tag_name = "iam_role_gaurav"
  }
}