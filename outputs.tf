# kms key
output "this_kms_key_id" {
  description = "The ID of the key."
  value       = concat(alicloud_kms_key.kms.*.id, [""])[0]
}

output "this_kms_key_arn" {
  description = "The Alicloud Resource Name (ARN) of the key."
  value       = concat(alicloud_kms_key.kms.*.arn, [""])[0]
}

output "this_kms_key_description" {
  description = "The description of the key."
  value       = concat(alicloud_kms_key.kms.*.description, [""])[0]
}

output "this_kms_key_usage" {
  description = "Specifies the usage of CMK."
  value       = concat(alicloud_kms_key.kms.*.key_usage, [""])[0]
}

output "this_kms_key_deletion_window_in_days" {
  description = "During pre-deletion days."
  value       = concat(alicloud_kms_key.kms.*.deletion_window_in_days, [""])[0]
}

output "this_kms_key_is_enabled" {
  description = "Whether the key is enabled."
  value       = concat(alicloud_kms_key.kms.*.is_enabled, [""])[0]
}

#encrypt
output "this_kms_ciphertext_ciphertext_blob" {
  description = "The ciphertext of the data key encrypted with the primary CMK version."
  value       = concat(alicloud_kms_ciphertext.kms.*.ciphertext_blob, [""])[0]
}

#decrypt
output "this_decrypt_plaintext" {
  description = "The decrypted plaintext."
  value       = concat(data.alicloud_kms_plaintext.kms.*.plaintext, [""])[0]
}

output "this_decrypt_key_id" {
  description = "The globally unique ID of the CMK. It is the ID of the CMK used to decrypt ciphertext."
  value       = concat(data.alicloud_kms_plaintext.kms.*.key_id, [""])[0]
}
