##Default
resource "aws_security_group" "default" {
    name = "Default With Terraform"
    vpc_id = aws_vpc.myvpc.id

    ingress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        self = true
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        self = true
    } 
}

##Security group for ssh
resource "aws_security_group" "natdevice" {
    name = "For SSH with NAT Device"
    vpc_id = aws_vpc.myvpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]        
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

##Security group for WebAccess
resource "aws_security_group" "web" {
    name = "For Web Access"
    vpc_id = aws_vpc.myvpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Security group created by Terraform"
    }
}
