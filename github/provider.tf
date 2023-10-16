provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ "/tmp/go-aws-credentials" ]
  profile = "default"
}
