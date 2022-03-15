packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu_java" {
  ami_name      = "${var.ami_prefix}-${var.ami_suffix}"
  instance_type = "t2.micro"
  region        = "${var.region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "packer-ubuntu"
  sources = [
    "source.amazon-ebs.ubuntu_java"
  ]

  provisioner "shell" {

    inline = [
      "echo Install Open JDK 8 - START",
      "sleep 10",
      "sudo apt-get update",
      "sudo apt-get install -y openjdk-8-jdk",
      "echo Install Open JDK 8 - SUCCESS",
    ]
  }
}