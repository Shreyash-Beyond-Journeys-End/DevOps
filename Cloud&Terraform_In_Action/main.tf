terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "MyHomeworkVPC"
  }
}

# 2. Create a Subnet in the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "MyHomeworkSubnet"
  }
}

# 3. Create a Security Group
resource "aws_security_group" "my_sg" {
  name        = "homework_sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyHomeworkSG"
  }
}

# 4. Create an EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id
  
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "MyHomeworkEC2"
  }

  # Example of explicitly showing dependency
  depends_on = [aws_security_group.my_sg]
}

# 5. Create an S3 Bucket (Name needs to be globally unique)
resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "homework-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name = "MyHomeworkBucket"
  }
}
