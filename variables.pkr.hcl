variable "ami_prefix" {
  type    = string
  default = "packer-aws-ubuntu-java"
}

variable "ami_suffix" {
  type    = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}