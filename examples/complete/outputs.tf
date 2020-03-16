# kms key
output "this_kms_key_id" {
  description = "The ID of the key."
  value       = module.kms.this_kms_key_id
}

output "this_kms_key_arn" {
  description = "The Alicloud Resource Name (ARN) of the key."
  value       = module.kms.this_kms_key_arn
}

output "this_kms_key_description" {
  description = "The description of the key."
  value       = module.kms.this_kms_key_description
}

output "this_kms_key_key_usage" {
  description = "Specifies the usage of CMK."
  value       = module.kms.this_kms_key_usage
}

output "this_kms_key_key_deletion_window_in_days" {
  description = "During pre-deletion days."
  value       = module.kms.this_kms_key_deletion_window_in_days
}

output "this_kms_key_key_is_enabled" {
  description = "Whether the key is enabled."
  value       = module.kms.this_kms_key_is_enabled
}


output "this_kms_ciphertext_ciphertext_blob" {
  description = "The ciphertext of the data key encrypted with the primary CMK version."
  value       = module.kms.this_kms_ciphertext_ciphertext_blob
}

#decrypt
output "this_decrypt_plaintext" {
  description = "The decrypted plaintext."
  value       = module.kms.this_decrypt_plaintext
}

output "this_decrypt_key_id" {
  description = "The globally unique ID of the CMK. It is the ID of the CMK used to decrypt ciphertext."
  value       = module.kms.this_decrypt_key_id
}
