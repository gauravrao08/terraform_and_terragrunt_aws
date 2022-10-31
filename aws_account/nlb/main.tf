module "alb" {
  source  = "../../../../../modules/lb/"
  name = "gaurav-nlb"

  load_balancer_type = "network"
  enable_deletion_protection = false 
  internal = false 
  ip_address_type = "ipv4"   ##if want to enable dualstack please mention ipv6, first need to enable on VPC level for dual stack

  vpc_id             = data.aws_vpc.my_vpc.id
  subnet_mapping = [for i, eip in aws_eip.eip_ip : { allocation_id : eip.id, subnet_id : tolist(data.aws_subnets.subnet_ids.ids)[i] }]
 
  /*access_logs = {
    bucket = "my-alb-logs"
  }*/


  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP_UDP"
      target_group_index = 0   ##this will match the first target group
    },
    {
      port               = 82
      protocol           = "UDP"
      target_group_index = 1  ##this will match the second target group
    },
    {
      port               = 83
      protocol           = "TCP"
      target_group_index = 2 ##this will match the third target group
    },
  ]



    target_groups = [
      ##this will match the first target group
    {
      name_prefix            = "tu1-"
      backend_protocol       = "TCP_UDP"
      backend_port           = 81
      target_type            = "instance"
      connection_termination = true
      preserve_client_ip     = true
      tags = {
        tcp_udp = true
      }
    },
    ##this will match the second target group
    {
      name_prefix      = "u1-"
      backend_protocol = "UDP"
      backend_port     = 82
      target_type      = "instance"
    },
     ##this will match the third target group
    {
      name_prefix          = "t1-"
      backend_protocol     = "TCP"
      backend_port         = 83
      target_type          = "ip"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
    },
  ]
}