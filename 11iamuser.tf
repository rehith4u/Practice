variable "user_names" {
  description = "Create IAM users"
  type        = list(string)
  default     = ["mithuntechnologies1","mithuntechnologies2","mithuntechnologies3"]
}

provider "aws" {
  region = "ap-southeast-1"
 }

 resource "aws_iam_user" "IAMUsers" {
   count = length(var.user_names)
   name = var.user_names[count.index]
 }

resource "aws_iam_user_policy_attachment" "msspolicy" {
  count = length(var.user_names)
  user       = aws_iam_user.IAMUsers[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

