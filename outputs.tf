#------------------------------------------------------------------------------
# Module Outputs
#------------------------------------------------------------------------------
output "cluster_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role"
  value       = element(concat(aws_iam_role.cluster.*.arn, [""]), 0)
}

output "cluster_role_name" {
  description = "The name of the role"
  value       = element(concat(aws_iam_role.cluster.*.name, [""]), 0)
}

output "node_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role"
  value       = element(concat(aws_iam_role.node.*.arn, [""]), 0)
}

output "node_role_name" {
  description = "The name of the role"
  value       = element(concat(aws_iam_role.node.*.name, [""]), 0)
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = element(concat(aws_security_group.this.*.arn, [""]), 0)
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = element(concat(aws_security_group.this.*.id, [""]), 0)
}

output "security_group_name" {
  description = "The name of the security group"
  value       = element(concat(aws_security_group.this.*.name, [""]), 0)
}

output "eks_cluster_id" {
  description = "The name of the cluster"
  value       = element(concat(aws_eks_cluster.this.*.id, [""]), 0)
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = element(concat(aws_eks_cluster.this.*.arn, [""]), 0)
}

output "eks_cluster_endpoint" {
  description = "The endpoint for your Kubernetes API server"
  value       = element(concat(aws_eks_cluster.this.*.endpoint, [""]), 0)
}

output "eks_node_id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)"
  value       = element(concat(aws_eks_node_group.this.*.id, [""]), 0)
}

output "eks_node_role_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = element(concat(aws_eks_node_group.this.*.node_role_arn, [""]), 0)
}
