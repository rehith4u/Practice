provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA5CY7AN3CABU43L7A"
  secret_key = "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"
}
 
 resource "aws_instance" "AWSServer" {
    count = "${var.instances}"
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "devopsmssmt"
    security_groups = ["launch-wizard-7"]
    tags = {
      Name = "Terraform Server - MSS - ${count.index}"
    }
 }

 //terraform apply -auto-approve -var instances="2"