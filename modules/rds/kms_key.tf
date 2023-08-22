resource "aws_kms_key" "key" {
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  description              = "KMS key that protects my RDS database volumes when no other key is defined"
  enable_key_rotation      = true
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = false
  deletion_window_in_days  = null
}
