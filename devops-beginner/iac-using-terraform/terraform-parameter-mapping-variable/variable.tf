variable "image_id" {
  type = string
  description = "The id of the machine image (AMI) to use for the instance."
}

variable "instance_type" {
  type = string
  description = "The type of instance to start."
  default = "t3.micro"
}

variable "region" {
  type = string
  description = "The AWS region to use."
  default = "ap-southeast-1"
}

variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" = "ami-093a7f5fbae13ff67"
    "ap-east-1" = "ami-0fa3fe0fa7920f68e"
  }
}