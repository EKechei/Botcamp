resource "aws_lb" "weblb" {
  name               = "weblb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  subnets            = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]
}

resource "aws_lb_target_group" "webTG" {
  name     = "webTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    enabled             = true
    port                = 80
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "webListener" {
  load_balancer_arn = aws_lb.weblb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webTG.arn
  }
}




resource "aws_lb" "applb" {
  name               = "applb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.appsg.id]

  subnets = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
}

resource "aws_lb_target_group" "appTG" {
  name     = "appTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    enabled             = true
    port                = 80
    interval            = 240
    protocol            = "HTTP"
    path                = "/health"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "appListener" {
  load_balancer_arn = aws_lb.applb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appTG.arn
  }
}

