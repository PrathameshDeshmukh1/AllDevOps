resource "aws_db_instance" "terra-rds"{
    engine =  var.engineName
    instance_class = "db.t3.micro"
    username = "admin"
    password = "Admin1234"
    allocated_storage = 20
    skip_final_snapshot = true
}