
resource "aws_launch_template" "weblt" {
  name                  = "weblt"
  image_id              = "ami-04ff98ccbfa41c9ad"
  instance_type         = "t2.micro"
  key_name              = "Eddy"
  depends_on            = [aws_vpc.vpc]

  network_interfaces {
    security_groups             = [aws_security_group.websg.id]
    associate_public_ip_address = true
  } 

   user_data = filebase64("script.sh")


}




resource "aws_autoscaling_group" "webasg" {
  name     = "webasg"
  min_size = 2
  max_size = 4

  health_check_type = "EC2"

  vpc_zone_identifier = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  target_group_arns = [aws_lb_target_group.webTG.arn]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.weblt.id
      }
      
    }
  }
}

resource "aws_autoscaling_policy" "webasgpolicy" {
  name                   = "webasgpolicy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.webasg.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 25.0
  }
}
