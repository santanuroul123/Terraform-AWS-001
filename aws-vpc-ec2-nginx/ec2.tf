# EC2 instance For Nginx 
resource "aws_instance" "Santanu-server" {
  ami                         = "ami-05edb7c94b324f73c"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.santanu-sg.id]
  associate_public_ip_address = true
#give instruction for install and start my nginx web server
  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "Santanu-Server"
  }
}