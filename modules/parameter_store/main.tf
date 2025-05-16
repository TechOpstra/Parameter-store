resource "aws_kms_key" "app_key" {
  description         = "KMS Key for encrypting Parameter Store"
  enable_key_rotation = true
}

resource "aws_ssm_parameter" "app_config" {
  name  = var.parameter_name
  type  = "SecureString"
  value = var.parameter_value
  key_id = aws_kms_key.app_key.arn  # Encryption enabled
}

output "parameter_arn" {
  description = "ARN of the Parameter Store"
  value       = aws_ssm_parameter.app_config.arn
}

variable "parameter_name" {
  description = "Name of the Parameter Store key"
  type        = string
}

variable "parameter_value" {
  description = "Value stored in Parameter Store (encrypted)"
  type        = string
}
