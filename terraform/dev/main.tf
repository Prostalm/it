module "app" {
  source       = "/home/vladlen/vladlen-bondarchuk/terraform/modules/app"
  instance_count = 1
  db_ip = module.db.db_ip

}

module "db" {
  source = "/home/vladlen/vladlen-bondarchuk/terraform/modules/db"
  security_group_app_id = module.app.security_group_app_id
}





