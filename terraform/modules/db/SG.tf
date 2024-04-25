
resource "aws_security_group" "db" {
  name_prefix = "db-"
  description = "Security group for database server"
}

 
resource "aws_security_group_rule" "db_out_app" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  security_group_id = aws_security_group.db.id
  source_security_group_id = var.security_group_app_id
}

resource "aws_security_group_rule" "db_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  security_group_id = aws_security_group.db.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_default_vpc" "this" {}

locals {
  vpc_subnet_cidr = aws_default_vpc.this.cidr_block
}

resource "aws_security_group_rule" "db_security" {
  
    type        = "ingress" 
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.vpc_subnet_cidr]
    security_group_id = aws_security_group.db.id
  
}

