locals {
  this_kms_key_id    = var.use_existing_key || var.existing_key_id != "" ? var.existing_key_id : concat(alicloud_kms_key.kms.*.id, [""])[0]
  ciphertext_blob    = var.decrypt ? var.ciphertext_blob : null
  encryption_context = var.decrypt ? var.encryption_context : null
}

resource "alicloud_kms_key" "kms" {
  count                  = var.use_existing_key ? 0 : var.create_kms ? 1 : 0
  description            = var.description
  key_usage              = var.key_usage
  pending_window_in_days = var.pending_window_in_days != "" ? var.pending_window_in_days : var.deletion_window_in_days
  status                 = var.status != "" ? var.status : var.is_enabled ? "Enabled" : "Disabled"
}

resource "alicloud_kms_ciphertext" "kms" {
  count              = var.encrypt ? 1 : 0
  plaintext          = var.plaintext
  key_id             = local.this_kms_key_id
  encryption_context = var.encryption_context
}

data "alicloud_kms_plaintext" "kms" {
  count              = var.decrypt ? 1 : 0
  ciphertext_blob    = local.ciphertext_blob
  encryption_context = local.encryption_context
}
