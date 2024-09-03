# main.tf
provider "aws" {
  region = var.region
}

# Create S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

# Create SQS queue
resource "aws_sqs_queue" "my_queue" {
  name = var.queue_name
}

# Create SNS topic
resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
}

# Create Lambda function
resource "aws_lambda_function" "my_lambda" {
  filename      = "lambda/index.js.zip"
  function_name = var.lambda_name
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.my_lambda_exec.arn

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
      QUEUE_URL   = aws_sqs_queue.my_queue.id
    }
  }
}

# Create IAM role for Lambda execution
resource "aws_iam_role" "my_lambda_exec" {
  name        = "my-lambda-exec"
  description = "Execution role for my-lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
}

# Create IAM policy for Lambda execution
resource "aws_iam_policy" "my_lambda_policy" {
  name        = "my-lambda-policy"
  description = "Policy for my-lambda"

  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ]
        Resource = "arn:aws:logs:*:*:*"
        Effect    = "Allow"
      },
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
        ]
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
        Effect    = "Allow"
      },
      {
        Action = [
          "sqs:SendMessage",
        ]
        Resource = aws_sqs_queue.my_queue.arn
        Effect    = "Allow"
      }
    ]
  })
}

# Attach IAM policy to Lambda execution role
resource "aws_iam_role_policy_attachment" "my_lambda_attach" {
  role       = aws_iam_role.my_lambda_exec.name
  policy_arn = aws_iam_policy.my_lambda_policy.arn
}

# Create SNS topic subscription for Lambda function
resource "aws_sns_topic_subscription" "my_lambda_sub" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.my_lambda.arn
}

# Create Lambda function permission for SNS topic
resource "aws_lambda_permission" "my_lambda_perm" {
  statement_id  = "AllowSNSInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.my_topic.arn
}