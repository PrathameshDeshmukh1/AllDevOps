output "EC2" {
    value = aws_instance.jenkins-server.id
}

output "VPC" {
    value = data.aws_vpc.default.id
}

output "EC2PublicIP"{
    value = aws_instance.jenkins-server.public_ip
}