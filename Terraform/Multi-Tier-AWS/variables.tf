variable "access_key" {
    description = "AWS Access Key"  
}
variable "secret_key" {
    description = "AWS secret access key"  
}
variable "region" {
    description = "AWS region to host my infra"
    default = "us-east-1"  
}
variable "vpc_cidr" {
    description = "VPC Cidr"
    default  = "10.1.0.0/16"
}
variable "public_subnet_cidr" {
    description = "CIDR for public subnet"
    default = "10.1.0.0/24"
  
}
variable "private_subnet_cidr" {
    description = "CIDR for private subnet"
    default =  "10.1.1.0/24"  
}

variable "amis" {
    description = "Base AMI to launch"
    default = {  
        us-east-1 = "ami-0fc61db8544a617ed"
    }
  }

