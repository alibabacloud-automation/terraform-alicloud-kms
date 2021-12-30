variable "region" {
  description = "(Deprecated from version 1.1.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.1.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.1.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.1.0) Skip staticvalidation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

variable "deletion_window_in_days" {
  description = "(Deprecated from version 1.3.0) Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Default to 30 days.New field 'pending_window_in_days' instead."
  type        = string
  default     = "30"
}

variable "is_enabled" {
  description = "(Deprecated from version 1.3.0) Specifies whether the key is enabled. Default to true.New field 'status' instead."
  type        = bool
  default     = true
}

#kms key
variable "create_kms" {
  description = "Whether to create kms key resource. Default to true."
  type        = bool
  default     = true
}

variable "use_existing_key" {
  description = "Whether to create key. If false, you can specify an existing key."
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the key as viewed in Alicloud console."
  type        = string
  default     = ""
}

variable "key_usage" {
  description = "Specifies the usage of CMK. Currently, default to 'ENCRYPT/DECRYPT', indicating that CMK is used for encryption and decryption."
  type        = string
  default     = "ENCRYPT/DECRYPT"
}

variable "pending_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = string
  default     = "30"
}

variable "status" {
  description = "The status of CMK."
  type        = string
  default     = "Enabled"
}

#kms ciphertext
variable "encrypt" {
  description = "Whether to encrypt plaintext. Default to true."
  type        = bool
  default     = true
}

variable "existing_key_id" {
  description = "The globally unique ID of the CMK."
  type        = string
  default     = ""
}

variable "plaintext" {
  description = "The plaintext to be encrypted which must be encoded in Base64."
  type        = string
  default     = ""
}

variable "encryption_context" {
  description = "The Encryption context. If you specify this parameter here, it is also required when you call the Decrypt API operation. For more information, see [Encryption Context](https://www.alibabacloud.com/help/doc-detail/42975.htm)."
  type        = map(string)
  default     = {}
}

#alicloud_kms_plaintext
variable "ciphertext_blob" {
  description = "The ciphertext of the data key encrypted with the primary CMK version."
  type        = string
  default     = ""
}

#kms decrypt
variable "decrypt" {
  description = "Whether to decrypt ciphertext. Default to true."
  type        = bool
  default     = true
}