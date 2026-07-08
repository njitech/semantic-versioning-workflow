terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "action-test-vpc"
    Env = "prod"
  }
}

terraform {
  backend "s3" {
    bucket = "s3-bucket-backend2026"
    key = "github-action/terraform.tfstate"
    region = "us-east-1"
  }
}
