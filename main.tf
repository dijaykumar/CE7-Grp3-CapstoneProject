provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "ce7_grp3_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "CE7-Grp3-VPC"
  }
}

# Subnet
resource "aws_subnet" "ce7_grp3_subnet" {
  vpc_id                  = aws_vpc.ce7_grp3_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "CE7-Grp3-Subnet"
  }
}

# Security Group
resource "aws_security_group" "ce7_grp3_sg" {
  vpc_id = aws_vpc.ce7_grp3_vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  tags = {
    Name = "CE7-Grp3-SG"
  }
}

# EC2 Instance
resource "aws_instance" "ce7_grp3_ec2" {
  ami                    = "ami-0453ec754f44f9a4a"  # Replace with your desired AMI (Amazon Linux 2)
  instance_type          = "t2.micro"
  key_name               = "CE7-Grp3-KeyPair"           # Replace with your SSH key name
  subnet_id              = aws_subnet.ce7_grp3_subnet.id
  security_groups = [aws_security_group.ce7_grp3_sg.name]
  associate_public_ip_address = true
  tags = {
    Name = "CE7-Grp3-EC2"
  }

  user_data = file("scripts/install_helloworld.sh")
}

# Output public IP
output "instance_public_ip" {
  value = aws_instance.ce7_grp3_ec2.public_ip
}
