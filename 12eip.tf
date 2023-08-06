# Provider Block
provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2mss" {
  ami               = "ami-0f86a70488991335e"
  instance_type     = "t2.micro"

  tags = {
    Name = "EC2Instance with Elastic IP -  MSS"
  }
}

resource "aws_eip" "msseip" {
  
}

resource "aws_eip_association" "mss_eip_assoc" {
  instance_id   = aws_instance.ec2mss.id
  allocation_id = aws_eip.msseip.id
}
