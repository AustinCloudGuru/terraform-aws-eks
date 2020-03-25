#------------------------------------------------------------------------------
# Create the EKS Cluster IAM Roles
#------------------------------------------------------------------------------
resource "aws_iam_role" "this" {
  name               = var.name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = merge(
  {
    "Name" = var.name
  },
  var.tags
  )
}

resource "aws_iam_role_policy_attachment" "this-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.this.id
}

resource "aws_iam_role_policy_attachment" "this-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSServicePolicy"
  role = aws_iam_role.this.id
}

data "aws_iam_policy_document" "assume_role" {
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
# Create the EKS Cluster Security Group
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
resource "aws_eks_cluster" "demo" {
  name     = var.name
  role_arn = aws_iam_role.this.arn

  vpc_config {
    security_group_ids = [aws_security_group.this.id]
    subnet_ids         = var.subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.this-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.this-AmazonEKSServicePolicy,
  ]
}

