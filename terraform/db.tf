resource "aws_instance" "db" {
ami = "ami-0c4c6802783f2505c"
instance_type = "t2.micro"
key_name = "lab-key"
tags = {
Name = "DB server"
project = "Devops"
}


}


