terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

#Create a complete VPC using module networking
module "network" {
  source = "./modules/networking"
  availability_zones = var.availability_zones
  cidr_block = var.cidr_block
  public_subnet_ips = var.public_subnet_ips
  private_subnet_ips = var.private_subnet_ips
  vpc_name = var.vpc_name
}


