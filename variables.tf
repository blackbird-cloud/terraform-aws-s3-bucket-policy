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

variable "attach_require_latest_tls_policy" {
  type        = bool
  default     = true
  description = "Attach a policy that will deny requests that use a TLS version lower then 1.2."
}

variable "attach_deny_insecure_transport_policy" {
  type        = bool
  default     = true
  description = "Attach a policy that will deny requests that have no secure transport."
}
