terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # access ve secret
  region = "us-east-1"
}
variable "key" {
  default = "real-estate-project"
}

variable "user" {
  default = "techpro"
}

resource "aws_instance" "managed_nodes" {
  ami = lookup(var.myami, terraform.workspace)
  instance_type ="${terraform.workspace == "dev" ? "t3a.medium" : "t2.micro"}"
  count = "${terraform.workspace == "prod" ? 3 : 1}"
  key_name = var.key
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  iam_instance_profile = "real-estate-project-profile-${var.user}"
  tags = {
    Name = "${terraform.workspace}-server"
  }
}

variable "myami" {
  type = map(string)
  default = {
    default = "ami-08b5b3a93ed654d19"
    dev     = "ami-0f88e80871fd81e91"
    prod    = "ami-04b4f1a9cf54c11d0"
  }
  description = "in order of aAmazon Linux 2023 ami, Red Hat Enterprise Linux 9 ami and Ubuntu Server 24.04 LTS ami"
}


resource "aws_security_group" "tf-sec-gr" {
  name = "project-real-estate-sec-gr"
  tags = {
    Name = "project-real-estate-sec-gr"
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "node_public_ip" {
  value = aws_instance.managed_nodes.public_ip
}