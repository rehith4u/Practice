resource "aws_instance" "AWSEIP"{
    ami = "ami-06a0b4e3b7eb7a300"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-2"]
    key_name = "rehithsiva"
    tags = {
        Name = "EC2 Instance By Terraform"
    }   
}

resource "aws_eip" "masseip"{

}

resource "aws_eip_association" "msseip_assoc"{
    instance_id = aws_instance.AWSEIP.id
    allocation_id = aws_eip.masseip.id
}