resource "aws_s3_bucket" "tf_state" {
  bucket = "${var.project_name}-${var.aws_region}-tf-state"

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
    Name = "${var.project_name}-${var.aws_region}-tf-state"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "${var.project_name}-${var.aws_region}-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.project_name}-${var.aws_region}-lock-table"
  }
}

