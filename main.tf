terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "proj-1" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "Project1 VPC"
  }
}

resource "aws_vpc" "proj-2" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "Project2 VPC"
  }
}

