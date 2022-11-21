resource "aws_s3_bucket" "example" {
  count  = length(var.bucket)
  bucket = var.bucket[count.index]
  tags   = var.tags
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  count  = length(var.bucket)
  bucket = element(aws_s3_bucket.example[*].id, count.index)
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = length(var.bucket)
  bucket = element(aws_s3_bucket.example[*].id, count.index)
  versioning_configuration {
    status = var.versioning_configuration
  }
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example[0].bucket
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count  = length(var.bucket)
  bucket = element(aws_s3_bucket.example[*].bucket, count.index)
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_object" "test" {
  for_each = fileset("./documents/", "**")
  bucket   = aws_s3_bucket.example[0].bucket
  key      = each.value
  source   = "./documents/${each.value}"
  etag     = filemd5("./documents/${each.value}")
}
