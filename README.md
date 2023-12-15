<!-- BEGIN_TF_DOCS -->
[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

# AWS S3 bucket policy module.
A Terraform module which helps you configure an access policy for your S3 bucket. Read [this](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-policies.html) page for more information.

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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4 |

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
| <a name="input_attach_elb_log_delivery_policy"></a> [attach\_elb\_log\_delivery\_policy](#input\_attach\_elb\_log\_delivery\_policy) | attach\_elb\_log\_delivery\_policy | `bool` | `false` | no |
| <a name="input_attach_lb_log_delivery_policy"></a> [attach\_lb\_log\_delivery\_policy](#input\_attach\_lb\_log\_delivery\_policy) | attach\_lb\_log\_delivery\_policy | `bool` | `false` | no |
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

Copyright © 2017-2023 [Blackbird Cloud](https://www.blackbird.cloud)
<!-- END_TF_DOCS -->