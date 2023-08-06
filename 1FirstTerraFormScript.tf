provider "aws" {
    region     = "ap-south-1"
    access_key = "AKIA24IO577BJHB2LREC"
    secret_key = "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"
}

resource "aws_instance" "AWSEC2Instance" {
    ami = "ami-06a0b4e3b7eb7a300"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-2"]
    key_name = "rehithsiva"
    tags = {
        Name = "EC2 Instance By Terraform"
    }

}