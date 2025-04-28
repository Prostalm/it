output "app_instances_public_ip" {
  value = "${aws_instance.app.*.public_ip}"

}

