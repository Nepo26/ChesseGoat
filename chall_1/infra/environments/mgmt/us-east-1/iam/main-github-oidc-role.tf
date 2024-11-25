module "iam_github_oidc_role" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  name = "GithubOidcRole"
  # This should be updated to suit your organization, repository, references/branches, etc.
  # TODO Limit branches that can assume this role
  subjects = [
    "Nepo26/*",
  ]

  policies = {
    TFStateManage = module.policy_state_admin.arn
    ManageRdsDatabases = module.policy_manage_databases.arn
    ManageSqsSns = module.policy_manage_sqs_sns.arn
    ManageCloudFront = module.policy_manage_cloudfront.arn
    ManageEksClusters = module.policy_manage_eks_clusters.arn
    ManageRoute53 = module.policy_manage_route53.arn
    ManageECR = module.policy_manage_ecr.arn
  }

  tags = {
    Environment = var.environment
  }
}
