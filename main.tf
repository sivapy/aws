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
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "Project1 VPC"
  }
}

resource "aws_vpc" "proj3" {
  cidr_block = "10.200.0.0/16"

  tags = {
    Name = "Project2 VP C"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.proj3.id
  cidr_block = "10.200.1.0/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.subnet1.id
  private_ips = ["10.200.1.100"]

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_instance" "myweb" {
  ami           = "ami-0011ac562eeee4a55"
  #instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  tags = {
    Name = "EC2-web"
  }
}


