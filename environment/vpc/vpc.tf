terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.38"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = "us-east-1"
}

variable "env" {
  type = string 
}

module "vpc" {
  source = "../../module/vpc"
  env = var.env
  cidr = "10.0.0.0/16"
}
  
