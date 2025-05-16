variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}



variable "user_email" {
  description = "Email address for receiving Parameter Store update notifications"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic from SNS module"
  type        = string
}

variable "event_rule_arn" {
  description = "ARN of the EventBridge rule"
  type        = string
}

variable "parameter_arn" {
  description = "ARN of the Parameter Store configuration"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function"
  type        = string
}
