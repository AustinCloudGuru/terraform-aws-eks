#------------------------------------------------------------------------------
# Module Variables
#------------------------------------------------------------------------------
variable "name" {
  description = "Name of the cluster"
  type = string
  default = "my-cluster"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = ""
}

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  type = list(string)
  default = []
}
