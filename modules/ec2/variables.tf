variable "aws_instance_name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0c0d3776ef525d5dd"
}

variable "aws_instance_accociate" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "iam_instance_profile" {
  type    = string
  default = null

}

variable "subnetID" {
  type    = string
  default = null
}

variable "security_groups" {
  type    = list(any)
  default = null
}

variable "eip" {
  type    = bool
  default = false
}

variable "ssh_key" {
  type    = string
  default = null
}

variable "user_data" {
  type    = string
  default = null
}