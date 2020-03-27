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
| ami\_type | Type of Amazon Machine Image (AMI) associated with the EKS Node Group (AL2\_x86\_64, AL2\_x86\_64\_GPU) | `string` | `"AL2_x86_64"` | no |
| cidr\_blocks | List of CIDR blocks | `list(string)` | `[]` | no |
| desired\_size | Desired number of worker nodes | `number` | `1` | no |
| disk\_size | Disk size in GiB for worker nodes | `number` | `20` | no |
| enabled\_cluster\_log\_types | A list of the desired control plane logging to enable | `list(string)` | <pre>[<br>  "api"<br>]</pre> | no |
| endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | `false` | no |
| endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. | `bool` | `true` | no |
| instance\_types | Set of instance types associated with the EKS Node Group | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| k8s\_version | Kubernetes version | `string` | `""` | no |
| labels | Key-value mapping of Kubernetes labels | `map(string)` | `{}` | no |
| max\_size | Maximum number of worker nodes | `number` | `1` | no |
| min\_size | minimum number of worker nodes | `number` | `1` | no |
| name | Name of the cluster | `string` | `"my-cluster"` | no |
| public\_access\_cidrs | List of CIDR blocks that can access the Amazon EKS public API server endpoint when enabled | `list(string)` | `[]` | no |
| release\_version | AMI version of the EKS Node Group | `string` | `""` | no |
| remote\_access | Configuration block with remote access settings | <pre>list(object({<br>    ec2_ssh_key               = string<br>    source_security_group_ids = list(string)<br>  }))</pre> | `[]` | no |
| retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group | `number` | `30` | no |
| subnet\_ids | List of subnet IDs. | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_role\_arn | The Amazon Resource Name (ARN) specifying the role |
| cluster\_role\_name | The name of the role |
| eks\_cluster\_arn | The Amazon Resource Name (ARN) of the cluster |
| eks\_cluster\_endpoint | The endpoint for your Kubernetes API server |
| eks\_cluster\_id | The name of the cluster |
| eks\_node\_id | EKS Cluster name and EKS Node Group name separated by a colon (:) |
| eks\_node\_role\_arn | The Amazon Resource Name (ARN) of the cluster |
| node\_role\_arn | The Amazon Resource Name (ARN) specifying the role |
| node\_role\_name | The name of the role |
| security\_group\_arn | The ARN of the security group |
| security\_group\_id | The ID of the security group |
| security\_group\_name | The name of the security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
