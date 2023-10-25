
## policy
#resource "aws_iam_policy" "policy" {
#  name        = "streem_policy"
#  path        = "/"
#  description = "Stream policy"
#
#
#  policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#          {
#            "Effect" : "Allow",
#            "Action" : [
#              "logs:CreateLogGroup",
#              "logs:CreateLogStream",
#              "logs:PutLogEvents",
#              "logs:DescribeLogStreams"
#            ],
#            "Resource" : [
#              "arn:aws:logs:eu-central-/*:*:*"
#            ]
#          }
#        ]
#      }
#  )
#}

# Create IAM role for CloudWatch policy
#resource "aws_iam_role" "cloudwatch_policy" {
#  name = "cloudwatch_policy"
#
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Action = "sts:AssumeRole"
#        Effect = "Allow"
#        Principal = {
#          Service = "ec2.amazonaws.com"
#        }
#      }
#    ]
#  })
#}



# Attach CloudWatch policy to IAM role
#resource "aws_iam_role_policy_attachment" "cloudwatch_admin_policy" {
#  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
#  role       = aws_iam_role.cloudwatch_policy.name
#}
#
#resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
#  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
#  role       = aws_iam_role.cloudwatch_policy.name
#}
#
## Create profile
#resource "aws_iam_instance_profile" "cloudwatch_policy" {
#  name = "cloudwatch_policy"
#  role = aws_iam_role.cloudwatch_policy.name
#}