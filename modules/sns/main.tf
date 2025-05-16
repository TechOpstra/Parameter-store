resource "aws_sns_topic" "parameter_alert" {
  name = "ParameterChangeNotification"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.parameter_alert.arn
  protocol  = "email"
  endpoint  = var.user_email
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.parameter_alert.arn
}

variable "user_email" {
  description = "Email address for notifications"
  type        = string
}
