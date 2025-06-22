resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "${var.project_name}-${var.aws_region}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric",
        x      = 0,
        y      = 0,
        width  = 24,
        height = 6,
        properties = {
          title   = "ECS CPU & Memory Utilization",
          view    = "timeSeries",
          stacked = false,
          region  = var.aws_region,
          period  = 300,
          stat    = "Average",
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ServiceName", "${var.project_name}-${var.aws_region}-service", "ClusterName", "${var.project_name}-${var.aws_region}-cluster"],
            [".", "MemoryUtilization", ".", ".", ".", ".", { "visible" : false }]
          ]
        }
      },
      {
        type   = "metric",
        x      = 0,
        y      = 6,
        width  = 24,
        height = 6,
        properties = {
          title   = "Memory Utilization Only",
          view    = "timeSeries",
          stacked = false,
          region  = var.aws_region,
          metrics = [
            ["AWS/ECS", "MemoryUtilization", "ServiceName", "${var.project_name}-${var.aws_region}-service", "ClusterName", "${var.project_name}-${var.aws_region}-cluster"]
          ]
        }
      }
    ]
  })
}

