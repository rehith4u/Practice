resource "aws_instance" "AWSEC2Instance" {
  ami             = "ami-0f86a70488991335e"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-2"]
  key_name        = "devopsmssmt"
  tags = {
    Name = "RedHat Server by Terraform"
  }
}