resource "aws_instance" "aws-20250621" {
  #Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  ami           = "ami-054400ced365b82a0"
  instance_type = "t3.micro"

  tags = {
    Name = "aws-20250621"
  }
}
