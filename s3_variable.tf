variable "bucket" {
  type    = list(any)
  default = ["cisco-test-0", "cisco-test-1"]
}

variable "acl" {
  type    = string
  default = "private"
}

variable "versioning_configuration" {
  type    = string
  default = "Enabled"
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"
}
