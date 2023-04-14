locals {
  stagging_env = "Staging"
}

resource "aws_vpc" "proj1" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "${local.stagging_env}_vpc1"
  }
}

resource "aws_vpc" "proj2" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "${local.stagging_env}_vpc2"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.proj2.id
  cidr_block = "10.20.1.0/24"

  tags = {
    Name = "${local.stagging_env}_vpc2_subnet"
  }
}




