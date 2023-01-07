resource "aws_s3_bucket" "first_task_bucket-070564344893" {
  bucket = "first-task-070564344893"

  tags = {
    Name        = "First task Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "first_task_bucket-070564344893" {
  bucket = aws_s3_bucket.first_task_bucket-070564344893.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "first_task_bucket" {
  bucket = aws_s3_bucket.first_task_bucket-070564344893.id
  policy = file("policy.json")
}


resource "aws_s3_bucket" "second_task_bucket-070564344893" {
  bucket = "second-task-070564344893"

  tags = {
    Name        = "second task Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "second_task_bucket-070564344893" {
  bucket = aws_s3_bucket.second_task_bucket-070564344893.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "second_task_bucket" {
  bucket = aws_s3_bucket.second_task_bucket-070564344893.id
  policy = file("policy2.json")
}

resource "aws_s3_bucket" "third_task_bucket-070564344893" {
  bucket = "third-task-070564344893"

  tags = {
    Name        = "third task Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "third_task_bucket-070564344893" {
  bucket = aws_s3_bucket.third_task_bucket-070564344893.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "third_task_bucket" {
  bucket = aws_s3_bucket.third_task_bucket-070564344893.id
  policy = file("hospital.json")
}
