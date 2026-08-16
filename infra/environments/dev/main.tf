terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider is configured at the environment level, not inside modules.
# All AWS API calls go to the local Moto emulator.
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    s3    = "http://localhost:5000"
    ec2   = "http://localhost:5000"
    iam   = "http://localhost:5000"
    elbv2 = "http://localhost:5000"
    rds   = "http://localhost:5000"
    sts   = "http://localhost:5000"
  }
}

# Network module with dev-specific parameters
module "network" {
  source = "../../modules/network"

  environment          = "dev"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

# Exposed outputs
output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

# ---------- ALB ----------
module "alb" {
  source = "../../modules/alb"

  environment       = "dev"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
