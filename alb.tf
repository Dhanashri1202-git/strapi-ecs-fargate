resource "aws_lb_target_group" "strapi" {
  name         = "${var.project_name}-${var.aws_region}-tg"
  port         = 1337
  protocol     = "HTTP"
  vpc_id       = aws_vpc.main.id
  target_type  = "ip"

  health_check {
    path                = "/"               # ✅ Use "/" instead of "/admin"
    interval            = 60                # ✅ Wait longer between checks
    timeout             = 10                # ✅ Give app time to respond
    healthy_threshold   = 2
    unhealthy_threshold = 5                 # ✅ Allow more failures before stopping
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

