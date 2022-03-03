#kms key
variable "description" {
  description = "The description of the key as viewed in Alicloud console."
  type        = string
  default     = "From Terraform"
}

variable "pending_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = string
  default     = "30"
}

variable "status" {
  description = "The status of CMK."
  type        = string
  default     = "PendingDeletion"
}