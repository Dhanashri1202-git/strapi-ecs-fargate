terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "strapi-ecs-ap-south-1-tf-state"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "strapi-ecs-ap-south-1-lock-table"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}



