resource "aws_instance" "my_instance" {
  ami           = "ami-033a6a056910d1137"
  instance_type = "t2.micro"
  subnet_id = "subnet-0745b6a789bb98399"

  tags = {
    Name = "New Host",
    Env = "TEST"
  }
}

resource "aws_s3_bucket" "bucketname0707" {
  bucket = "tets-my-tf-test-bucket-01-07-07"

  tags = {
    Name        = "Bucket Name 07 07"
    Environment = "Tesv1t"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "USER 06 -- main"
  }
}

resource "aws_subnet" "mainpub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.11.0/24"

  tags = {
    Name = "PUBLIC User06"
  }
}

resource "aws_subnet" "mainprv" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.110.0/24"

  tags = {
    Name = "PRIVATE User06"
  }
}

output "vpc-id" {
  value = aws_vpc.main.id
}

output "public-subnet-id" {
  value = aws_subnet.mainpub.id
}

output "private-subnet-id" {
  value = aws_subnet.mainprv.id
}
