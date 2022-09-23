module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "7.0.0"
  # insert the 4 required variables here

  name = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = [module.loadbalancer_sg.security_group_id]
  
  # Listeners
  # HTTP Listener - HTTP to HTTPS Redirect
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port = "443"
        protocol = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  # Target Groups
  target_groups = [
    # APP 1 TG
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      tags = local.common_tags # Target Group Tags
    },
  ]

  # HTTPS Listener
  https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.aws_acm_certificate.issued.arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed static message - for root context /*"
        status_code  = "200"
      }
    }
  ]

  # HTTPS Listener Rules
  https_listener_rules = [
    # Rule 1" /app1* should go to App1 EC2 Instances
    {
      https_listener_index = 0

      actions = [
        {
          type = "forward"
          target_group_index = 0
        }
      ]

      conditions = [{
        path_patterns = ["/*"]
      }]
    },
  ]

  tags = local.common_tags
}