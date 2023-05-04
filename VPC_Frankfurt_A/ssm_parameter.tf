

resource "aws_ssm_parameter" "AmazonCloudWatch-linux" {
  name        = "AmazonCloudWatch-linux"
  description = "CloudWatch log configuration"
  type        = "String"
  value       = file("../data/Amazon-cloudwatch-linux/config.json")
  tags = {
    environment = "prod"
  }
}