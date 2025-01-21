resource "aws_instance" "jenkins-server"{
    ami = data.aws_ami.available-ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [data.aws_security_group.default.id]
    key_name = "Verginia"


    user_data = file("jenkins-server-installation.sh")
    tags = {
        Name = "jenkins-server"
    }
}


resource "aws_security_group_rule" "allow_ssh" {
   // vpc_id = data.aws_vpc.default.id

            type      = "ingress"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            security_group_id = data.aws_security_group.default.id
            
    }

    resource "aws_security_group_rule" "allow_http" {
    type                     = "ingress"
    from_port                = 8080
    to_port                  = 8080
    protocol                 = "tcp"
    security_group_id       = data.aws_security_group.default.id
    cidr_blocks             = ["0.0.0.0/0"]  # Allow HTTP from anywhere
    }
    
