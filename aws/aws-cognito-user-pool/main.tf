terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_cognito_user_pool" "dev" {
  name = "my-user-pool"

  password_policy {
    temporary_password_validity_days = 7
    minimum_length                   = 6
    require_numbers                  = false
    require_uppercase                = false
    require_symbols                  = false
  }

  account_recovery_setting {
    recovery_mechanism {
      priority = 1
      name     = "verified_email"
    }
  }

  tags = {
    Name = "github"
  }
}

resource "aws_cognito_user_pool_domain" "dev" {
  user_pool_id = aws_cognito_user_pool.dev.id
  domain       = "my-user-pool-domain"
}

resource "aws_cognito_user_pool_client" "dev" {
  user_pool_id = aws_cognito_user_pool.dev.id
  name         = "my-user-pool-client"
}

resource "aws_cognito_user_group" "dev" {
  user_pool_id = aws_cognito_user_pool.dev.id
  name         = "my-user-group"

}

resource "aws_cognito_user_in_group" "dev" {
  user_pool_id = aws_cognito_user_pool.dev.id
  group_name   = aws_cognito_user_group.dev.name
  username     = aws_cognito_user.dev.username
}

resource "aws_cognito_user" "dev" {
  user_pool_id = aws_cognito_user_pool.dev.id
  username     = "john"

  attributes = {
    email          = "no-reply@my-dev-email.com"
    email_verified = true
  }
}
