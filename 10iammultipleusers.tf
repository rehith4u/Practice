provider "aws" {
  region = "ap-south-1"
 }
 
 resource "aws_iam_user" "IAMUsers" {
   count = length(var.user_names)
   name  = var.user_names[count.index]
 }

