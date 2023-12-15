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
