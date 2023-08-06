variable "ami" {
  description = "Amazon Machine Image type.."
	default = "ami-0f86a70488991335e"
}

variable "instance_type" {
  description = "Instance type, weather t2.micro, t2.medium..."
	default = "t2.micro"
}

variable "instances" {
  description = "Total number of instances which we are going to create"
  default = 2
}
/*
variable "instances"{

} 
//terraform apply -auto-approve -var instances="2"
*/