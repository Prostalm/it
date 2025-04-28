
variable "app_ami_id" {
  description = "ami id for app instance"
  validation {
    condition = length(var.app_ami_id) > 4 && substr(var.app_ami_id,0,4) == "ami-"
    error_message = "The app_ami_id value must be a valid AMI id" 
  }    
}
variable "db_ami_id" {
  description = "ami id for db instance"
  validation {
    condition = length(var.db_ami_id) > 4 && substr(var.db_ami_id,0,4) == "ami-"
    error_message = "The db_ami_id value must be a valid AMI id" 
  }  
}

variable "key_name" {
default = "lab-key"
}

variable "provision_key_path" {
default = "~/.ssh/lab-key.pem"
}


