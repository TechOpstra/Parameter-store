variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "user_email" {
  description = "Email address for receiving Parameter Store update notifications"
  type        = string
  default     = "sbvh1437@gmail.com"
}
