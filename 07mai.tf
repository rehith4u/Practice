provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA5CY7AN3CABU43L7A"
  secret_key = "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"
}

resource "aws_instance" "AWSEC2Instance" {
  ami             = "ami-0f86a70488991335e"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-2"]
  key_name        = "devopsmssmt"
  tags = {
    Name = "RedHat Server by Terraform"
  }
}