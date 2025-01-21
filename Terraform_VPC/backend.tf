terraform {
   backend "s3"{
    bucket = "terras3bucket1212"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
    dynamodb_table = "dynamo-table-project"
   }
}