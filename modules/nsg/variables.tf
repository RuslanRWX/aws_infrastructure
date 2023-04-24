
variable "name" {
  type    = string
  default = null

}
variable "cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "incoming_ports" {
  type    = list(any)
  default = null
}

variable "outgoing_ports" {
  type    = list(any)
  default = null
}

variable "vpcID" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = "TCP"
}