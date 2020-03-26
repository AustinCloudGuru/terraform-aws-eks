#------------------------------------------------------------------------------
# EKS Cluster IAM Role
#------------------------------------------------------------------------------
resource "aws_iam_role" "cluster" {
  name               = join("-", [var.name, "cluster"])
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.cluster.json
  tags = merge(
    {
      "Name" = join("-", [var.name, "cluster"])
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.id
}

resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster.id
}

data "aws_iam_policy_document" "cluster" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "eks.amazonaws.com"
      ]
    }
  }
}

#------------------------------------------------------------------------------
# EKS Node IAM Role
#------------------------------------------------------------------------------
resource "aws_iam_role" "node" {
  name               = join("-", [var.name, "node"])
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.node.json
  tags = merge(
    {
      "Name" = join("-", [var.name, "node"])
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node.name
}


data "aws_iam_policy_document" "node" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

#------------------------------------------------------------------------------
# EKS Cluster Security Group
#------------------------------------------------------------------------------
resource "aws_security_group" "this" {
  name        = var.name
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}

resource "aws_security_group_rule" "https" {
  cidr_blocks       = var.cidr_blocks
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  to_port           = 443
  type              = "ingress"
}



#------------------------------------------------------------------------------
# EKS Cluster
#------------------------------------------------------------------------------
resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids      = [aws_security_group.this.id]
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
  }
  enabled_cluster_log_types = [var.enabled_cluster_log_types]

  tags = merge(
    {
      "Name" = join("-", [var.name, "node"])
    },
    var.tags
  )

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy,
  ]
}

resource "aws_cloudwatch_log_group" "this" {
  count             = var.retention_in_days ? 1 : 0
  name              = "/aws/eks/${var.name}/cluster"
  retention_in_days = var.retention_in_days
  tags = merge(
    {
      "Name" = join("-", [var.name, "node"])
    },
    var.tags
  )

}

#------------------------------------------------------------------------------
# EKS Node Group
#------------------------------------------------------------------------------
resource "aws_eks_node_group" "demo" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = join("-", [var.name, "-ng"])
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  tags = merge(
    {
      "Name" = join("-", [var.name, "node"])
    },
    var.tags
  )

  depends_on = [
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
