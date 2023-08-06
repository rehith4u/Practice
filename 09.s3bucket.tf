resource    "aws_s3_bucket" "S3ByMSS"{
 bucket = "s3bucketagfsdgfdhgfjhgkjh"
 acl = "private"
 versioning {
     enabled = true
    }   

lifecycle_rule{
    enabled = true

    transition {
        days = 30
        storage_class = "STANDARD_IA"
    }

    
    transition {
        days = 60
        storage_class = "GLACIER"
    }
     tags = {
         Name = "S3 Bucket created by TF"
     }
}
