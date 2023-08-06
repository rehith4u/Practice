variable "AMI" {
    description = "This variable having the AMI Value"
    default = "ami-06a0b4e3b7eb7a300"
}

variable "instanceType" {
    description = "This variable having the Instance Type Value"
    default = "t2.micro"
}

variable "NumberOfInstance" {
    description = "This variable having the count value"
    default = "4"
}

terraform apply -auto-approve -var NumberOfInstance="2"