variable "tags" {
  type = map
}

variable vpc_id {
  type = string
  description = "ID of an existing VPC."
  default = "vpc-0926e26ef0721bf97"
}

variable subnet_id {
  type = string
  description = "ID of an existing subnet"
  default = "subnet-0a09e8ea837f8606b"
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

variable "use_elastic_ip" {
  type = bool
  description = "whether to use an elastic ip or not"
  default = true 
}

// optional
variable "dns_record_name" {
  type = any
  default = [] 
  description = "type A DNS record wich will be mapped to public ip"
}

variable "dns_zone_id" {
  type = string 
  description = "zone id for dns record"
  default = "REPLACE_ME"  
}
