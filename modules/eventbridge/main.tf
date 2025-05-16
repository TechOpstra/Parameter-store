resource "aws_cloudwatch_event_rule" "parameter_change" {
  name        = "ParameterStoreChangeRule"
  description = "Triggers when Parameter Store is updated"

  event_pattern = jsonencode({
    source       = ["aws.ssm"]
    detail-type  = ["Parameter Store Change"]
  })
}

# EventBridge Target: Send SNS Notification on Parameter Change
resource "aws_cloudwatch_event_target" "sns_target" {
  rule      = aws_cloudwatch_event_rule.parameter_change.name
  target_id = "SendSNSNotification"
  arn       = var.sns_topic_arn  # Referencing SNS ARN from the SNS module
}

output "event_rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.parameter_change.arn
}
variable "sns_topic_arn" {
  description = "ARN of the SNS topic from the SNS module"
  type        = string
}
