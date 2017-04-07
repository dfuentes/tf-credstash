// KMS Key ID for the generated CMK
output "kms_key_id" {
  value       = "${aws_kms_key.credstash_cmk.key_id}"
}

// ARN for the generated dynamodb table
output "dynamo_table_arn" {
  value       = "${aws_dynamodb_table.store.arn}"
}
