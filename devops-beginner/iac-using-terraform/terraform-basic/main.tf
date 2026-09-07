terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "duongcon-keypair" {
  key_name = "duongcon-keypair"
  public_key = file("./keypair/duongcon-key.pub")
}

resource "aws_instance" "duongcon-instance" {
  ami = "ami-0fa377108253bf620"
  instance_type = "t3.micro"
  key_name = aws_key_pair.duongcon-keypair.key_name
  tags = {
    Name = "DuongCon-Instance"
  }
  vpc_security_group_ids = [aws_security_group.duongcon-security-group.id]
}

resource "aws_security_group" "duongcon-security-group" {
  name        = "duongcon-security-group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}