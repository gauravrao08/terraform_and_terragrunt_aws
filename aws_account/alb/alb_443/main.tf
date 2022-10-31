module "alb" {
  source  = "../../../../../../modules/lb/"
  name = "gaurav-alb"
  internal = false

  load_balancer_type = "application"
  enable_deletion_protection = false 
    ip_address_type = "ipv4"   ##if want to enable dualstack please mention ipv6, first need to enable on VPC level for dual stack

  vpc_id             = "vpc-0e61b6db5c93bff27"   ### update VPC ID
  subnets            = ["subnet-0c2bfa1f526e5e3ac", "subnet-0f53a13bc0e29021a"]
  security_groups    = ["sg-09e67bd9d112c774b", "sg-06e11e364ed203bb6"]

  /*access_logs = {
    bucket = "my-alb-logs"
  }*/

  target_groups = [
    {
      name_prefix      = "http-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      #deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      targets = {
        ec2_target_one = {
          target_id = "i-0b8085aab5f03cbf9"
          port = 80
        }
        /*ec2_target_two = {
          target_id = "i-a1b2c3d4e5f6g7h8i"
          port = 8080
        }*/
      }
      tags = {
        InstanceTargetGroupTag = "target-group-http"   ## dont delete this tag
      }   
    },
    {
      name_prefix      = "https-"
      backend_protocol = "HTTPS"
      backend_port     = 443
      target_type      = "instance"
      #deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      tags = {
        InstanceTargetGroupTag = "target-group-https"   ## dont delete this tag
      }   
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:eu-west-1:287323428084:certificate/06a6273d-2bf3-4045-b90a-62f9b1eb3b02"
      target_group_index = 1
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
    manage-by = "terraform"  ## dont delete this tag
  }

  lb_tags = {
    MyLoadBalancer = "lab-tag-name"     ## dont delete this tag
  }

   http_tcp_listeners_tags = {
    MyLoadBalancerTCPListener = "http-listner-tag"   ### dont delete this tag
  }
}