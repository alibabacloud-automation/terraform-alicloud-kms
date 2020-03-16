# kms key
output "this_kms_key_id" {
  description = "The ID of the key."
  value       = alicloud_kms_key.kms.*.id
}

output "this_kms_key_arn" {
  description = "The Alicloud Resource Name (ARN) of the key."
  value       = alicloud_kms_key.kms.*.arn
}

output "this_kms_key_description" {
  description = "The description of the key."
  value       = alicloud_kms_key.kms.*.description
}

output "this_kms_key_usage" {
  description = "Specifies the usage of CMK."
  value       = alicloud_kms_key.kms.*.key_usage
}

output "this_kms_key_deletion_window_in_days" {
  description = "During pre-deletion days."
  value       = alicloud_kms_key.kms.*.deletion_window_in_days
}

output "this_kms_key_is_enabled" {
  description = "Whether the key is enabled."
  value       = alicloud_kms_key.kms.*.is_enabled
}

output "this_kms_ciphertext_ciphertext_blob" {
  description = "The ciphertext of the data key encrypted with the primary CMK version."
  value       = alicloud_kms_ciphertext.kms.*.ciphertext_blob
}

#decrypt
output "this_decrypt_plaintext" {
  description = "The decrypted plaintext."
  value       = data.alicloud_kms_plaintext.kms.plaintext
}

output "this_decrypt_key_id" {
  description = "The globally unique ID of the CMK. It is the ID of the CMK used to decrypt ciphertext."
  value       = data.alicloud_kms_plaintext.kms.key_id
}
