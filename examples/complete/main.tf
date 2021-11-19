module "kms" {
  source = "../.."

  #key
  create_kms             = true
  use_existing_key       = false
  description            = var.description
  key_usage              = "ENCRYPT/DECRYPT"
  pending_window_in_days = var.pending_window_in_days
  status                 = var.status

  #ciphertext
  encrypt   = true
  decrypt   = true
  plaintext = "example"
  encryption_context = {
    test = "test"
  }

}