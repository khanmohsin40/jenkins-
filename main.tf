provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "jenkins-module"{
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "13dec"
    vpc_security_group_ids = [aws_security_group.jenkins-sg-module2.id]
    user_data = file (jenkins.sh)
tags = {
    name  = "myinstance"
}
}


resource "aws_security_group" "jenkins-sg-module2"{
    name = "jenkins-sg-module2"
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

