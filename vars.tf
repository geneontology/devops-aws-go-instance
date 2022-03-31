variable "tags" {
  type = map
}

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro" 
}

// custom ubuntu ami with docker, docker-compose, and python3 installed
variable "ami" {
  default = "ami-01e51d86b60c02297" 
}

variable "disk_size" {
  type = number 
  description = "size of disk in Gigabytes"
}

variable "public_key_path" {
  type = string 
  description = "path to ssh public key"
}

variable "open_ports" {
  type    = list(number)
}
