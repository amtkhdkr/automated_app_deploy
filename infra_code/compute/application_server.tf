resource "aws_instance" "application_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet2.id

  security_groups = [aws_security_group.web_traffic.name]
  key_name        = "ameetk"
  provisioner "remote-exec" {
    inline = [
        "curl -fsSL https://get.docker.com -o get-docker.sh",
        "sh get-docker.sh",
        "docker run -p 127.0.0.1:80:80/tcp myappserver amtkhdkr/sample_maven_image"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/ameetk.pem")
  }

  tags = {
    "Name"      = "Application_Server"
    "Terraform" = "true"
  }
}