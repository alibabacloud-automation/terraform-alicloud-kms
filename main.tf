provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/kms"
}

locals {
  this_kms_key_id    = var.use_existing_key == true || var.existing_key_id != "" ? var.existing_key_id : concat(alicloud_kms_key.kms.*.id, [""])[0]
  ciphertext_blob    = var.decrypt == true || alicloud_kms_ciphertext.kms.0.ciphertext_blob != "" ? alicloud_kms_ciphertext.kms.0.ciphertext_blob : null
  encryption_context = var.decrypt == true || alicloud_kms_ciphertext.kms.0.encryption_context != "" ? alicloud_kms_ciphertext.kms.0.encryption_context : null

}

resource "alicloud_kms_key" "kms" {
  count                   = var.use_existing_key == true ? 0 : var.create_kms ? 1 : 0
  description             = var.description
  key_usage               = var.key_usage
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
}

resource "alicloud_kms_ciphertext" "kms" {
  count              = var.existing_key_id != "" ? var.existing_key_id : var.encrypt ? 1 : 0
  plaintext          = var.plaintext
  key_id             = concat(alicloud_kms_key.kms.*.id, [""])[0]
  encryption_context = var.encryption_context
}

data "alicloud_kms_plaintext" "kms" {
  ciphertext_blob    = local.ciphertext_blob
  encryption_context = local.encryption_context
}

