#resource "aws_kms_key" "encryption_key" {
#  count = var.create_kms_key ? 1 : 0
#
#  description         = "KMS key to encrypt logs in group ${var.logs_path}"
#  enable_key_rotation = true
#  policy = templatefile("${path.module}/templates/kms_key_policy.tftpl", {
#    policy_id  = "encryption-${var.logs_path}",
#    account_id = data.aws_caller_identity.current.account_id,
#    region     = data.aws_region.current.name
#  })
#}

#------------------------------------------------------------------------------
# AWS CLOUDWATCH LOG GROUP
#------------------------------------------------------------------------------
#resource "aws_cloudwatch_log_group" "log_group" {
#  name              = "Main-Group"
#  retention_in_days = 7
#  tags = {
#    Name = "Main-logs"
#  }
#}

#------------------------------------------------------------------------------
# AWS CLOUDWATCH LOG STREAM
#------------------------------------------------------------------------------
#resource "aws_cloudwatch_log_stream" "log_stream" {
#  name           = "main VM stream"
#  log_group_name = aws_cloudwatch_log_group.log_group.name
#}
# Set up CloudWatch monitoring for the EC2 instance
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "cpu-utilization-70"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric checks CPU utilization and triggers an alarm if it's above 70%."

  alarm_actions = [
    aws_sns_topic.cpu_utilization_70.arn
  ]

  dimensions = {
    InstanceId = module.vm01.id
  }
}


# Create an SNS topic for alarm notifications
resource "aws_sns_topic" "cpu_utilization_70" {
  name = "cpu-utilization-70"
}