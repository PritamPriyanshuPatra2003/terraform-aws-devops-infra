resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true
  key_name                    = "Terraform-devops-key"


  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Frontend Apache Server created using Terraform</h1>" > /var/www/html/index.html
    EOF

  tags = {

    Name = "frontend-apache-server"
  }
}


resource "aws_instance" "backend" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]
  associate_public_ip_address = false
  key_name                    = "Terraform-devops-key"

  user_data = <<-EOF
#!/bin/bash
yum update -y

cat <<EOT > /etc/yum.repos.d/mongodb-org-7.0.repo
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-7.0.asc
EOT

yum install -y mongodb-org
systemctl start mongod
systemctl enable mongod
EOF

  tags = {
    Name = "backend-mongodb-server"
  }
}