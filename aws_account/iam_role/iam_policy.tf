## first file
####################################################
resource "aws_iam_policy" "policy" {
  name        = "policy_name"
  path        = "/"
  description = "policy description pemission on ec2_complete"

  policy = jsonencode(
    {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": "ec2:Describe*",
                    "Resource": "*"
                },
                {
                    "Effect": "Allow",
                    "Action": "elasticloadbalancing:Describe*",
                    "Resource": "*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "cloudwatch:ListMetrics",
                        "cloudwatch:GetMetricStatistics",
                        "cloudwatch:Describe*"
                    ],
                    "Resource": "*"
                },
                {
                    "Effect": "Allow",
                    "Action": "autoscaling:Describe*",
                    "Resource": "*"
                }
            ]
    }
  )

  tags = {
    tag_name = "gaurav-ec2-readonly"
  }
}