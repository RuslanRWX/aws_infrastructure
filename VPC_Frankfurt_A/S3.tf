##resource "aws_s3_bucket" "store01" {
##  bucket = "rwx-bucket-store01"
##
##  tags = {
##    Name        = "rwx-backet-store01"
##    Environment = "Dev"
##  }
##}

#resource "aws_s3_bucket_acl" "store1" {
##  depends_on = [aws_s3_bucket_ownership_controls.example]
#
#  bucket = aws_s3_bucket.store01.id
#  acl    = "private"
#}