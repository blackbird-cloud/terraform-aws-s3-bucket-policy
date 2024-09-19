<!-- BEGIN_TF_DOCS -->
# Terraform Aws S3 Bucket Policy Module
Terraform module to create an AWS S3 bucket policy

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
data "aws_caller_identity" "current" {}

module "s3_bucket_policy" {
  source  = "blackbird-cloud/s3-bucket-policy/aws"
  version = "~> 0"

  s3_bucket_id = "mybucketid"
  policy       = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "Allow source account access to the bucket",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::mybucketid",
          "arn:aws:s3:::mybucketid/*"
        ]
    }
  ]
}
  EOF
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_elb_service_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.deny_insecure_transport](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.elb_log_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lb_log_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.require_latest_tls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_deny_insecure_transport_policy"></a> [attach\_deny\_insecure\_transport\_policy](#input\_attach\_deny\_insecure\_transport\_policy) | Attach a policy that will deny requests that have no secure transport. | `bool` | `true` | no |
| <a name="input_attach_elb_log_delivery_policy"></a> [attach\_elb\_log\_delivery\_policy](#input\_attach\_elb\_log\_delivery\_policy) | attach\_elb\_log\_delivery\_policy | `bool` | `false` | no |
| <a name="input_attach_lb_log_delivery_policy"></a> [attach\_lb\_log\_delivery\_policy](#input\_attach\_lb\_log\_delivery\_policy) | attach\_lb\_log\_delivery\_policy | `bool` | `false` | no |
| <a name="input_attach_require_latest_tls_policy"></a> [attach\_require\_latest\_tls\_policy](#input\_attach\_require\_latest\_tls\_policy) | Attach a policy that will deny requests that use a TLS version lower then 1.2. | `bool` | `true` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The fully-formed AWS policy as JSON for the S3 bucket access policy | `string` | `null` | no |
| <a name="input_s3_bucket_id"></a> [s3\_bucket\_id](#input\_s3\_bucket\_id) | The name of the bucket. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy"></a> [policy](#output\_policy) | The applied S3 bucket policy. |

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2024 [Blackbird Cloud](https://blackbird.cloud)
<!-- END_TF_DOCS -->