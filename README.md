# devops-aws-go-instance

- A terraform module for Deploying an instance using an ubuntu image with docker and docker-compose installed.

The example below how to import this module and display the elastic public ip of the instance.

```
module "go_instance" {
  source = "git::https://github.com/geneontology/devops-aws-go-instance.git"
  instance_type = "t2.micro"
  public_key_path = "~/.ssh/id_rsa.pub"
  tags =  { Name = "test-my-go-instance" }
  open_ports = [80, 22]
  disk_size = 100
}

output "public_ip" {
   value                  = module.go_instance.public_ip
}

```
