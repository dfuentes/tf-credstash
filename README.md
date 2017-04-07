# tf-credstash

Module to create the infrastructure necessary to use credstash (KMS/dynamodb).  This module creates your key with the default key policy.  This gives the root account user full access to the key and enables using IAM policies to manage key access.


## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| key_alias | Alias to give to your kms key | `alias/credstash` | no |
| read_capacity | Read capacity for dynamodb table | `1` | no |
| table_name | Name to give to the dynamodb table | `credential-store` | no |
| write_capacity | Write capacity for the dynamodb table | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| dynamo_table_arn | ARN for the generated dynamodb table |
| kms_key_id | KMS Key ID for the generated CMK |
