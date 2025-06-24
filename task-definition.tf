resource "aws_ecs_task_definition" "strapi" {
  family                   = "strapi-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "strapi"
      image     = "03922/strapi-app:latest"
      essential = true
      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "NODE_ENV"
          value = "production"
        },
        {
          name  = "APP_KEYS"
          value = "ybB9yjzg3+FG3AXK85hXBw==" # generated key
        },
        {
          name  = "JWT_SECRET"
          value = "BwcvjHj6gU5PJr/oC16sQQ==" # your earlier secret
        },
        {
          name  = "ADMIN_JWT_SECRET"
          value = "yoursecretadminjwtvalue" # optional, if you use Admin JWT
        },
        {
          name  = "API_TOKEN_SALT"
          value = "somerandomtokensalt" # optional, used for secure API tokens
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.strapi.name
          awslogs-region        = "ap-south-1"
          awslogs-stream-prefix = "strapi"
        }
      }
    }
  ])
}

