variable "region" {
  type        = string
  description = "Region"
  default     = "eu-central-1"
}

variable "sg_name" {
  type        = string
  description = "Security Group name"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "ingress_rules" {
  type        = list(any)
  description = "ingress rules - list of maps {port (int), protocol (string), cidr_blocks (list of strings)}"
  default = [
    { port = 22, protocol = "tcp", cidr_blocks = []}
  ]
}


