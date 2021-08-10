resource "aws_eks_cluster_team2" "qa_cluster_team2" {

  name = "qa_cluster_team2"

  role_arn = var.qa_cluster_iam_role_arn

  vpc_config {
    subnet_ids = var.available_subnets
  }

  # depends_on = var.iam_roles_eks_cluster

}

resource "aws_eks_node_group_team2" "qa_node_group_team2" {

  cluster_name = aws_eks_cluster.qa_cluster.name

  node_group_name = "qa_node_group_team2"

  node_role_arn = var.qa_node_iam_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 1

    max_size = 1

    min_size = 1

  }

  # depends_on = var.iam_roles_eks_node

}
