output "awsec2instanceublicIP"{
    description = "The Public IP address of EC2 instance"
    value = "${aws_instance.AWSEC2Instance.public_ip}"
}


output "awsec2instancePrivateIP"{
    description = "The Private IP address of EC2 instance"
    value = "${aws_instance.AWSEC2Instance.private_ip}"
}

output "InstanceID"{
    description = "The EC2 Instance ID"
    value = "${aws_instance.AWSEC2Instance.id}"
}