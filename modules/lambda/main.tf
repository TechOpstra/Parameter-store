resource "aws_lambda_function" "fetch_parameter" {
  function_name = "FetchParameterLambda"
  runtime       = "python3.10"
  handler       = "function.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "function.zip"  # This contains your Lambda code
  source_code_hash = filebase64sha256("function.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "LambdaParameterStoreRole"

  assume_role_policy = jsonencode({
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "lambda_ssm_access" {
  name = "LambdaSSMAccessPolicy"

  policy = jsonencode({
    Version   = "2012-10-17",  # ✅ Required for valid IAM policies
    Statement = [{
      Effect   = "Allow"
      Action   = ["ssm:GetParameter"]
      Resource = var.parameter_arn
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_ssm_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_ssm_access.arn
}


variable "parameter_arn" {
  description = "ARN of the Parameter Store"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS Topic"
  type        = string
}

output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.fetch_parameter.arn
}
