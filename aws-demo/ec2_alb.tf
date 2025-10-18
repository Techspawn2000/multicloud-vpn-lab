resource "aws_instance" "web" {
  ami                    = "ami-0c94855ba95c71c99" # Amazon Linux 2 (update as needed)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.web.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  user_data              = file("scripts/web_userdata.sh")

  tags = {
    Name = "${var.project_name}-web-instance"
  }
}

resource "aws_lb" "app_lb" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.web.id, aws_subnet.app.id]
  security_groups    = [aws_security_group.web_sg.id]

  tags = {
    Name = "${var.project_name}-alb"
  }
}
