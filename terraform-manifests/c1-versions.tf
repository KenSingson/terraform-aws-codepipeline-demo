# Terraform Block
terraform {
  required_version = "~> 1.2"  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}