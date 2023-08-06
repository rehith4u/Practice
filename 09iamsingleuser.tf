provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA5CY7AN3CABU43L7A"
  secret_key = "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"
 }
 
 resource "aws_iam_user" "IAMUSERS" {
    name = "mithuntechnologies"
 }
