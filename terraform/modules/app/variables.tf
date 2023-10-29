variable "key_name" {
default = "lab-key"
}

variable "provision_key_path" {
default = "~/.ssh/web-key.pem"
}

variable "instance_count" {
  description = "Кількість інстансів, які мають бути створені"
  type        = number
  default     = 1

}
variable "db_ip" {
  description = "DB server internal IP address"
}


