variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Nome do par de chaves SSH"
  type = string
}
