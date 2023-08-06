resource "aws_instance" "AWSEC2Instance" {
    count = "${var.NumberOfInstance}"
    ami = "${var.AMI}"
    instance_type = "${var.instanceType}"
    security_groups = ["launch-wizard-2"]
    key_name = "rehithsiva"
    tags = {
        Name = "EC2 Instance By Terraform"
    }