variable "key_alias" {
  description = "Alias to give to your kms key"
  default     = "alias/credstash"
}

variable "table_name" {
  description = "Name to give to the dynamodb table"
  default     = "credential-store"
}

variable "read_capacity" {
  description = "Read capacity for dynamodb table"
  default     = "1"
}

variable "write_capacity" {
  description = "Write capacity for the dynamodb table"
  default     = "1"
}
