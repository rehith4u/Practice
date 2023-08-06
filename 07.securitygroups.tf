resource "aws_security_group" "SecurityGroupbyMSS"{
    name = "SecurityGroupMyTF"
    description = "This SG Created by Automatically through TF"
    vpc_id = "vpc-999f57f2"

    ingress {
        description = "Enabling the Inbound Rules"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Enabling the Outbound Rules"
        from_port = 8080
        to_port = 9980
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SG by TF"
    }
}