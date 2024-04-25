variable "key_name" {
default = "lab-key"
}

variable "provision_key_path" {
default = "~/.ssh/lab-key.pem"
}

variable "instance_count" {
  description = "Кількість інстансів, які мають бути створені"
  type        = number
  default     = 1

}
variable "db_ip" {
  description = "DB server internal IP address"
}

variable "app_ami_id" {
  description = "AMI_id, example: ami-06d613176878b7894"
  validation {
    condition = length(var.app_ami_id) > 4 && substr(var.app_ami_id,0,4) == "ami-"
    error_message = "The app_ami_id value must be a valid AMI id"
}
}

variable "sg_id" {
  description = "Security Group ID"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
} 
