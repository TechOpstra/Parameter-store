output "parameter_arn" {
  description = "ARN of the Parameter Store configuration"
  value       = module.parameter_store.parameter_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns.sns_topic_arn
}

output "event_rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = module.eventbridge.event_rule_arn
}

output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.lambda_arn
}
