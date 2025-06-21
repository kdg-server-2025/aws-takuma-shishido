variable "public_key" {
  type        = string
}
variable "key_name" {
  type        = string
}

resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "aws-20250621" {
  #Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  ami           = "ami-054400ced365b82a0"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.ssh_enable.id]

  tags = {
    Name = "aws-20250621"
    UserDate = "true"
  }

  key_name = var.key_name
}
