data "aws_security_group" "default" {
  name = "default"
}

resource "aws_default_vpc" "this" {}

locals {
  vpc_subnet_cidr = aws_default_vpc.this.cidr_block
  ingress_app_rules = [
    { port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]},   # SSH
    { port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },   # WEB
    { port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }, # app port
  ]
  ingress_db_rules = [
    { port = 22, protocol = "tcp", cidr_blocks = [local.vpc_subnet_cidr] },
    { port = 3306, protocol = "tcp", cidr_blocks = [local.vpc_subnet_cidr] },
  ]
}

module "app" {
  source       = "../modules/app"
  instance_count = 3
  app_ami_id     = var.app_ami_id
  sg_id          = module.SG-app.sg_id
  db_ip          = module.db.db_ip

}

module "db" {
  source         = "../modules/db"
  sg_id          = module.SG-db.sg_id
  db_ami_id      = var.db_ami_id
}


module "SG-app" {
  source        = "../modules/SG"
  sg_name       = "app_sg_prod"
  vpc_id        = aws_default_vpc.this.id
  ingress_rules = local.ingress_app_rules
}

module "SG-db" {
  source        = "../modules/SG"
  sg_name       = "db_sg_prod"
  vpc_id        = aws_default_vpc.this.id
  ingress_rules = local.ingress_db_rules
}





