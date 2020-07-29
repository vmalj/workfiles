## Creating 2 Instances
resource "aws_instance" "application" {
    count = 2
    ami = "ami-a6b8e7ce"
    instance_type="t2.micro"  
    subnet_id=aws_subnet.public.id
    security_groups=[aws_security_group.default.id]
}