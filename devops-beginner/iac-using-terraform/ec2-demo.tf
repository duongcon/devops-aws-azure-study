# This block configures Terraform and specifies the required providers.
# For this example, we need the "aws" provider from HashiCorp.
# It's a good practice to pin the provider to a specific version range.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# This block configures the AWS provider itself, for example, by setting the region.
# You can also configure credentials here, but it's recommended to use environment variables
# or IAM roles for better security.
provider "aws" {
  region = "us-east-1" # You can change this to your preferred AWS region
}

# This data source is used to dynamically find the latest Amazon Linux 2 AMI.
# This is more robust than hardcoding an AMI ID, which can become outdated.
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"] # Filter by the owner of the AMI

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# This is the main resource block that defines the EC2 instance.
resource "aws_instance" "web_server" {
  # The AMI to use for the instance. We're using the ID from our data source.
  ami = data.aws_ami.amazon_linux_2.id

  # The type of instance to start. t2.micro is eligible for the AWS Free Tier.
  instance_type = "t2.micro"

  # Tags are key-value pairs that you can assign to AWS resources.
  tags = {
    Name = "ExampleWebServer"
  }
}