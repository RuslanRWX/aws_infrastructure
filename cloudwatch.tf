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
