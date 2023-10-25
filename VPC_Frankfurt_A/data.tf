data "aws_caller_identity" "current" {}

#data "aws_vpc" "vpc0-frankfurtB" {
#    filter {
#     name   = "tag:Name"
#      values = ["frankfurt-B"]
#  }
#}