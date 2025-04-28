resource "aws_instance" "db" {
  ami                    = var.db_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]

tags = {
    Name = "DB server prod"
  }

}

