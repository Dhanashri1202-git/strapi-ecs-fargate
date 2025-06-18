# terraform/ecs-cluster.tf

resource "aws_ecs_cluster" "strapi" {
  name = "${var.project_name}-cluster"
}
