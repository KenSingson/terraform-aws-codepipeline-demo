module "autoscaling" {
  depends_on = [
    module.alb
  ]
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.5.2"

  name = "${local.name}-asg-lt"
  # use_name_prefix = false
  # use_name_prefix = "${local.name}-"

  # Launch Template
  launch_template_name = "${local.name}-asg-lt1"
  # launch_template_use_name_prefix = "${local.name}-"
  launch_template_description = "launch template for asg"
  update_default_version = true

  image_id = data.aws_ami.amz_linux2.id
  instance_type = var.instance_type
  user_data = filebase64("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  # ebs_optimized = true
  enable_monitoring = true

  security_groups = [ module.private_sg.security_group_id ]

  # Instance Storage - Block Devices
  block_device_mappings = [
    {
        device_name = "/dev/xvda"
        ebs = {
            delete_on_termination = true
            encrypted = true
            volume_size = 20
            volume_type = "gp2"
        }
    }
  ]

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name = local.name
      }
    }
  ]

  min_size = 2
  max_size = 10
  desired_capacity = 2
  # wait_for_capacity_timeout = 0
  health_check_type = "EC2"
  vpc_zone_identifier = module.vpc.private_subnets
  service_linked_role_arn = aws_iam_service_linked_role.autoscaling.arn
  # Associate ALB with ASG
  target_group_arns = module.alb.target_group_arns

  initial_lifecycle_hooks = [
    {
        name = "${local.name}-startup-lifecycle-hook"
        default_result = "CONTINUE"
        heartbeat_timeout = 60
        lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
        notification_metadata = jsonencode({"message" = "scaling out"})
    },
    {
        name = "${local.name}-termination-lifecycle-hook"
        default_result = "CONTINUE"
        heartbeat_timeout = 180
        lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
        notification_metadata = jsonencode({"message" = "scaling in"})
    }
  ]
  
  # Instance Refresh
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
        min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }

  # Target Scaling Policies
  scaling_policies = {
    "${local.name}-avg-cpu-policy-greater-than-50" = {
      policy_type               = "TargetTrackingScaling"
      estimated_instance_warmup = 180
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 50.0
      }
    },
    "${local.name}-alb_target_requests_greater_than_yy" = {
      policy_type               = "TargetTrackingScaling"
      estimated_instance_warmup = 120
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ALBRequestCountPerTarget"
          resource_label = "${module.alb.lb_arn_suffix}/${module.alb.target_group_arn_suffixes[0]}"
        }
        target_value = 10.0
      }
    }
  }

  # Schedules
  schedules = {
    increase_capacity_7am = {
      min_size = 2
      max_size = 10
      desired_capacity = 2
      recurrence = "0 7 * * 1-5" # Mon-Fri in the evening
      time_zone = "Europe/Rome"
    }

    decrease_capacity_5pm = {
      min_size = 1
      max_size = 5
      desired_capacity = 1
      recurrence = "0 17 * * 1-5" # Mon-Fri in the evening
      time_zone = "Europe/Rome"
    }
  }

  # Tags
  tags = local.common_tags
  
}