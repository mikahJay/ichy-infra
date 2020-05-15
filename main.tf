# configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}
# create the instance
resource "aws_instance" "ichy" {
  ami           = "ami-f4f4cf91"
  instance_type = "t2.nano"
  monitoring = true
  key_name = "ec2-2"
}
resource "aws_eip" "lb" {
  instance = "${aws_instance.ichy.id}"
  vpc = true
}
