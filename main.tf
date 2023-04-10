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

resource "aws_vpc" "proj1" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "Project1 V P C"
  }
}

resource "aws_vpc" "proj2" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "Project2 V P C"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.proj2.id
  cidr_block = "10.20.1.0/24"

  tags = {
    Name = "Main"
  }
}





