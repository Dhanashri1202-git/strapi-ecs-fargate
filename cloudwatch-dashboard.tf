resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "strapi-ecs-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        x = 0
        y = 0
        width = 12
        height = 6
        properties = {
          title = "ECS CPU Utilization"
          view = "timeSeries"
          stacked = false
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.project_name, { "stat": "Average" } ]
          ]
          region = var.aws_region
        }
      },
      {
        type = "metric"
        x = 12
        y = 0
        width = 12
        height = 6
        properties = {
          title = "ECS Memory Utilization"
          view = "timeSeries"
          stacked = false
          metrics = [
            [ "AWS/ECS", "MemoryUtilization", "ClusterName", var.project_name, { "stat": "Average" } ]
          ]
          region = var.aws_region
        }
      },
      {
        type = "metric"
        x = 0
        y = 6
        width = 24
        height = 6
        properties = {
          title = "ECS Network In/Out"
          view = "timeSeries"
          stacked = false
          metrics = [
            [ "AWS/ECS", "NetworkRxBytes", "ClusterName", var.project_name ],
            [ ".", "NetworkTxBytes", ".", "." ]
          ]
          region = var.aws_region
        }
      }
    ]
  })
}
