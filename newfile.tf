provider "aws"{
    region ="us-east-2"
    access_key=""
    secret_key=""
}

resource "aws_instance""Rehith"{
    ami = "ami-068257025f72f470d"
    instance_type = "t2.micro"
    key_name = "rehithsiva"
    security_groups = ["launch-wizard-7"]
    tags={
        Name = "Terraform by Rehith"
    }
}