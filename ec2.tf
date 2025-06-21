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
  # user_data_base64 = "IyEvdXNyL2Jpbi9lbnYgYmFzaApzZXQgLUNldXgKc2V0IC1vIHBpcGVmYWlsCgp3Z2V0IGh0dHBzOi8vZ2l0aHViLmNvbS90YWt1bWEtc2hpc2hpZG8ua2V5cyAtbyAvaG9tZS91YnVudHUvLnNzaC9hdXRob3JpemVkX2tleXMKY2htb2QgNjAwIC9ob21lL3VidW50dS8uc3NoL2F1dGhvcml6ZWRfa2V5cw=="

  key_name = var.key_name
}
