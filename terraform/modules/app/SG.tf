resource "aws_security_group" "app" {
  name_prefix = "app-"
  description = "Security group for app server"
}

# Правила для доступу до security group "app"
resource "aws_security_group_rule" "app_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}

resource "aws_security_group_rule" "web_app" {
  type        = "ingress"
  from_port   = 8000
  to_port     = 8000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}

resource "aws_security_group_rule" "app_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  security_group_id = aws_security_group.app.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app_out2" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  security_group_id = aws_security_group.app.id
  cidr_blocks = ["0.0.0.0/0"]
}
