output "Terraform_Test" {
  value = aws_instance.Terraform_Test.id
  description = "This will return EC2 ID"
}

output "Terra_test"{
    value = aws_instance.Terra_Test.id
    description = "This will give Prod EC2 ID"
}