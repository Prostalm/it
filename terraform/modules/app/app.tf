resource "aws_instance" "app" {
  count                  = var.instance_count
  ami                    = var.app_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]


connection {
type = "ssh"
host = self.public_ip
user = "ec2-user"
private_key = file("~/.ssh/lab-key.pem")
}

provisioner "remote-exec" {
    inline = [
      # Додавання запису в /etc/hosts
      "echo '${var.db_ip} db.server' | sudo tee -a /etc/hosts",	
    ]
  }

provisioner "file" {
source = "${path.module}/files/myapp.service"
destination = "/tmp/myapp.service"
}

provisioner "remote-exec" {
script = "${path.module}/files/deploy.sh"

}
tags = {
    Name = "App server prod${count.index + 1}"
  }
}
