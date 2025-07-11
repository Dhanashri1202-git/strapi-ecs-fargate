provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "strapi-ecs-ap-south-1-tf-state"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "strapi-ecs-ap-south-1-tf-state"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "strapi-ecs-ap-south-1-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "strapi-ecs-ap-south-1-lock-table"
  }
}
