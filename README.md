# Terraform module
Terraform module which creates

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.23 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cidr\_blocks | List of CIDR blocks | `list(string)` | `[]` | no |
| desired\_size | Desired number of worker nodes | `number` | `1` | no |
| endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | `false` | no |
| endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. | `bool` | `true` | no |
| max\_size | Maximum number of worker nodes | `number` | `1` | no |
| min\_size | minimum number of worker nodes | `number` | `1` | no |
| name | Name of the cluster | `string` | `"my-cluster"` | no |
| public\_access\_cidrs | List of CIDR blocks that can access the Amazon EKS public API server endpoint when enabled | `list(string)` | `[]` | no |
| subnet\_ids | List of subnet IDs. | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID | `string` | `""` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
