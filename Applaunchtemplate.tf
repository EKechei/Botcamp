resource "aws_launch_template" "applt" {
  name_prefix     = "Applaunchtemplate-"
  image_id        = "ami-07caf09b362be10b8"  
  instance_type   = "t2.micro" 
  key_name         = "Eddy"              
  depends_on      = [aws_vpc.vpc]
 network_interfaces {
    security_groups             = [aws_security_group.appsg.id]
    associate_public_ip_address = false
  } 
}
resource "aws_autoscaling_group" "appasg" {
  name     = "appasg"
  min_size = 2
  max_size = 4

  health_check_type = "EC2"

  vpc_zone_identifier = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]

  target_group_arns = [aws_lb_target_group.appTG.arn]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.applt.id
      }
      
    }
  }
}

resource "aws_autoscaling_policy" "appasgpolicy" {
  name                   = "appasgpolicy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.appasg.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 25.0
  }
}