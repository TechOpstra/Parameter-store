

# Parameter Store Module: Securely stores configuration values
module "parameter_store" {
  source          = "./modules/parameter_store"
  parameter_name  = "/app/config/api_key"
  parameter_value = "your-secret-api-key"
}

# EventBridge Module: Monitors Parameter Store changes & triggers SNS
module "eventbridge" {
  source       = "./modules/eventbridge"
  sns_topic_arn = module.sns.sns_topic_arn  # Reference SNS module output
}

# SNS Module: Sends notifications upon updates
module "sns" {
  source     = "./modules/sns"
  user_email = "htemper2@gmail.com"  # Change to recipient's email
}

# Lambda Module: Fetches Parameter Store values & publishes to SNS
module "lambda" {
  source        = "./modules/lambda"
  parameter_arn = module.parameter_store.parameter_arn
  kms_key_arn   = module.parameter_store.kms_key_arn  # Ensure KMS ARN is passed
}


