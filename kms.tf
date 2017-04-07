# This data source is necessary to get the current aws account id to set in
# the key policy
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "key_policy" {
  statement {
    sid    = "Allow IAM permissions"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_kms_key" "credstash_cmk" {
  description = "KMS key used by credstash for encrypt/decrypt"
  policy      = "${data.aws_iam_policy_document.key_policy.json}"
}

resource "aws_kms_alias" "alias" {
  name          = "alias/credstash"
  target_key_id = "${aws_kms_key.credstash_cmk.key_id}"
}
