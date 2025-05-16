resource "aws_cloudwatch_event_rule" "parameter_change" {
  name        = "ParameterStoreChangeRule"
  description = "Triggers when Parameter Store is updated"

  event_pattern = jsonencode({
    source = ["aws.ssm"]
    detail-type = ["Parameter Store Change"]
  })
}

output "event_rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.parameter_change.arn
}

