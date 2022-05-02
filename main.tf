# .tf file basic HCL code for main.tf
# Configure the AWS provider
terraform {
  # Terraform Cloud : 
    cloud {
    organization = "<ORG_NAME>"
    workspaces {
      name = "Example-Workspace"
    }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  # Ubuntu 16.04 instnace 
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0077..."]
  subnet_id              = "subnet-923a..."

  tags = {
    Name = var.instance_name
  }
}