variable "s3_bucket_id" {
  description = "The name of the bucket."
  type        = string
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON for the S3 bucket access policy"
  type        = string
  default     = null
}

variable "attach_elb_log_delivery_policy" {
  description = "attach_elb_log_delivery_policy"
  type        = bool
  default     = false
}

variable "attach_lb_log_delivery_policy" {
  description = "attach_lb_log_delivery_policy"
  type        = bool
  default     = false
}
