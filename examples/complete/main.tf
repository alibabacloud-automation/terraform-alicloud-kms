//create a new kms
module "kms" {
  source = "../.."

  #key
  use_existing_key       = false
  create_kms             = true
  description            = var.description
  key_usage              = "ENCRYPT/DECRYPT"
  pending_window_in_days = var.pending_window_in_days
  status                 = var.status

  encrypt = false
  decrypt = false
}

//encrypt
module "encrypt" {
  source = "../.."
  #key
  use_existing_key = true
  create_kms       = false
  existing_key_id  = module.kms.this_kms_key_id
  encrypt          = true
  decrypt          = false
  plaintext        = "example"
  encryption_context = {
    test = "test"
  }

}

//decrypt
module "decrypt" {
  source = "../.."
  #key
  use_existing_key = true
  create_kms       = false
  existing_key_id  = module.kms.this_kms_key_id
  encrypt          = false
  decrypt          = true
  ciphertext_blob  = module.encrypt.this_kms_ciphertext_ciphertext_blob
  encryption_context = {
    test = "test"
  }
}