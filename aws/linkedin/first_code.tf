provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "tf_course" {
    bucket = "tf-course-20220127"
    acl = "private"
}