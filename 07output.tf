output "aws_public_ip" {
    description = "The Public IP address of the  server instance, which it created now."
    value = "${aws_instance.AWSEC2Instance.public_ip}"
}

output "aws_private_ip" {
    description = "The Private IP address of the server instance, which it created now."
    value = "${aws_instance.AWSEC2Instance.private_ip}"
}

