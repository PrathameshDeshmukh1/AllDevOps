resource "aws_s3_bucket" "s3-bucket-from-project" {
    bucket = "terraAutomation2"
    versioning {
        enabled = true
    }
}