### third file
###############################################################
resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.this_role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "this" {
  name  = "aws_role_name_gaurav"
  role  = aws_iam_role.this_role.name

  tags = {
    role_name = "gaurav_role_name"
  }
}