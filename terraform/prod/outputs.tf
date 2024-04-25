output "db_int_ip" {
  value = module.db.db_ip
}

output "app_instance_ips" {
  value = module.app.app_instances_public_ip
}

