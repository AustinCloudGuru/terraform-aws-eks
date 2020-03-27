#------------------------------------------------------------------------------
# Module Variables
#------------------------------------------------------------------------------
variable "name" {
  description = "Name of the cluster"
  type        = string
  default     = "my-cluster"
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
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "List of subnet IDs."
  type        = list(string)
  default     = []
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "endpoint_public_access" {
  description = " Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "List of CIDR blocks that can access the Amazon EKS public API server endpoint when enabled"
  type        = list(string)
  default     = []
}

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable"
  type        = list(string)
  default     = ["api"]
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  type        = number
  default     = 30
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group (AL2_x86_64, AL2_x86_64_GPU)"
  type        = string
  default     = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "instance_types" {
  description = "Set of instance types associated with the EKS Node Group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "labels" {
  description = "Key-value mapping of Kubernetes labels"
  type        = map(string)
  default     = {}
}

variable "release_version" {
  description = "AMI version of the EKS Node Group"
  type        = string
  default     = ""
}

variable "version" {
  description = "Kubernetes version"
  type        = string
  default     = ""
}

variable "remote_access" {
  description = "Configuration block with remote access settings"
  type = list(object({
    ec2_ssh_key               = string
    source_security_group_ids = list(string)
  }))
  default = []
}
