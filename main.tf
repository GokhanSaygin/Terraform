#Define provider and region
provider "aws" {
  region = "us-east-1"
}

#Define provider and terraform versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#Create users
resource "aws_iam_user" "dev_users" {
  count = length(var.dev_users)
  name  = element(var.dev_users, count.index)
}

resource "aws_iam_user" "ops_users" {
  count = length(var.ops_users)
  name  = element(var.ops_users, count.index)
}

resource "aws_iam_user" "monitoring_users" {
  count = length(var.monitoring_users)
  name  = element(var.monitoring_users, count.index)
}

resource "aws_iam_user" "data_users" {
  count = length(var.data_users)
  name  = element(var.data_users, count.index)
}

resource "aws_iam_user" "admin_users" {
  count = length(var.admin_users)
  name  = element(var.admin_users, count.index)
}

#Create groups
resource "aws_iam_group" "dev_users" {
  name = "devs"
}

resource "aws_iam_group" "ops_users" {
  name = "ops"
}

resource "aws_iam_group" "monitoring_users" {
  name = "monitoring"
}

resource "aws_iam_group" "data_users" {
  name = "data"
}

resource "aws_iam_group" "admin_users" {
  name = "admins_1"
}

#Add users to a groups
resource "aws_iam_group_membership" "dev_users" {
  name  = "dev_group"
  users = var.dev_users
  group = aws_iam_group.dev_users.name
}

resource "aws_iam_group_membership" "ops_users" {
  name  = "ops_group"
  users = var.ops_users
  group = aws_iam_group.ops_users.name
}

resource "aws_iam_group_membership" "monitoring_users" {
  name  = "monitoring_group"
  users = var.monitoring_users
  group = aws_iam_group.monitoring_users.name
}

resource "aws_iam_group_membership" "data_users" {
  name  = "data_group"
  users = var.data_users
  group = aws_iam_group.data_users.name
}

resource "aws_iam_group_membership" "admin_users" {
  name  = "admin_group"
  users = var.admin_users
  group = aws_iam_group.admin_users.name
}

#Add policies to groups
resource "aws_iam_group_policy" "dev_policy" {
  name   = "dev_policy"
  group  = aws_iam_group.dev_users.name
  policy = file("devs_policy.json")
}

resource "aws_iam_group_policy" "ops_policy" {
  name   = "ops_policy"
  group  = aws_iam_group.ops_users.name
  policy = file("ops_policy.json")
}

resource "aws_iam_group_policy_attachment" "managed_ops_policy" {
  group      = aws_iam_group.ops_users.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "managed_monitoring_policy" {
  group      = aws_iam_group.monitoring_users.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "managed_monitoring_policy_2" {
  group      = aws_iam_group.monitoring_users.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_group_policy" "data_policy" {
  name   = "data_policy"
  group  = aws_iam_group.data_users.name
  policy = file("data_policy.json")
}

resource "aws_iam_group_policy" "admin_policy" {
  name   = "admin_policy"
  group  = aws_iam_group.admin_users.name
  policy = file("admin_policy.json")
}
