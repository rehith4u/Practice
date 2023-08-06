provider "aws"{
    region = "ap-south-1"
    access_key = "AKIA5KT2FR4HAAZW2BBC"
    secret_key = "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"
}

resource "aws_instance" "AWSEC2Instance"{
    count = "4"
    ami = "ami-0a9d27a9f4f5c0efc"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-3"]
    key_name = "devopsmss"
    tags = {
        Name = "RedHat Server by Terraform"
    }
}
