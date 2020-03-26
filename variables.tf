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

variable "subnet_ids" {
  description = "List of subnet IDs."
  type = list(string)
  default = []
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type = number
  default = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type = number
  default = 1
}

variable "min_size" {
  description = "minimum number of worker nodes"
  type = number
  default = 1
}
