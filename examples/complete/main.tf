variable "region" {
  default = "cn-beijing"
}
variable "profile" {
  default = "default"
}
provider "alicloud" {
  region  = var.region
  profile = var.profile
}

module "kms" {
  source  = "../.."
  region  = var.region
  profile = var.profile

  #key
  description             = "Hello_KMS"
  deletion_window_in_days = "7"
  is_enabled              = true

  #ciphertext
  encrypt         = true
  plaintext       = "example"
  ciphertext_blob = "test"

  #decrypt
  decrypt = true
}