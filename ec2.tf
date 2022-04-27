variable "ami" {
  description = "x86"
  type        = string
}

variable "availability_zone_name" {
  type    = string
  default = "cn-north-1a"
}


resource "aws_instance" "mytest" {
  ami           = ""
  instance_type = ""
  tags = {
    Name = "mytest"
  }
}