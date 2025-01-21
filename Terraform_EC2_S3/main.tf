resource "aws_instance" "Terraform_Test" {
  ami = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Terraform_Test"
    Env = "Dev24"
  }
}

resource "aws_instance" "Terra_Test"{
  ami ="ami-053b12d3152c0cc71"
  instance_type = "t2.micro"

  tags = {
    Name = "2nd-Test"
    Env = "Production"
  }
}

resource "aws_s3_bucket" "Terra_Bucket" {
  bucket = "bucket-terra-sumit-aws"
}