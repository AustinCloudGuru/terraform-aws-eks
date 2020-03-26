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
| max\_size | Maximum number of worker nodes | `number` | `1` | no |
| min\_size | minimum number of worker nodes | `number` | `1` | no |
| name | Name of the cluster | `string` | `"my-cluster"` | no |
| subnet\_ids | List of subnet IDs. | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID | `string` | `""` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
