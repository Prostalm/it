resource "aws_instance" "db" {
ami = "ami-0c4c6802783f2505c"
instance_type = "t2.micro"
key_name = "lab-key"
vpc_security_group_ids = [aws_security_group.db.id]
tags = {
Name = "DB server"
project = "Devops"

}


}


