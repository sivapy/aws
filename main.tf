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
resource "aws_vpc" "proj-3" {
  cidr_block = "10.30.0.0/16"

  tags = {
    Name = "Project3 VPC"
  }
}
resource "aws_vpc" "proj-4" {
  cidr_block = "10.40.0.0/16"

  tags = {
    Name = "Project4 VPC"
  }
}