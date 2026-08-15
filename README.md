# Highly Available Web Platform on AWS

Production-like highly available web platform described with Terraform and validated locally against mocked AWS APIs (MotoServer).

## Overview

- VPC with public/private subnets across 2 Availability Zones
- Application Load Balancer + Auto Scaling Group
- RDS PostgreSQL, S3, IAM, CloudWatch
- CI/CD validation via GitHub Actions

The Terraform code targets real AWS APIs. For free local development and testing we use MotoServer (open-source AWS API emulator), because LocalStack Community Edition does not include ELBv2 and RDS.

## Tech Stack

- Terraform (Infrastructure as Code)
- AWS (EC2, VPC, ELBv2, RDS, S3, IAM, CloudWatch)
- MotoServer (local AWS API emulation)
- Docker / Docker Compose
- GitHub Actions (CI/CD)
- Bash (automation)

## Project Structure

    aws-ha-web-platform/
    ├── infra/              # Terraform code
    │   ├── modules/        # Reusable modules (network, alb, asg, rds, s3, iam)
    │   ├── environments/   # dev / staging / prod
    │   └── global/         # Global resources
    ├── moto/               # Local AWS emulator (docker compose)
    ├── app/                # Demo application
    ├── scripts/            # Automation scripts
    ├── diagrams/           # Architecture diagrams
    ├── docs/               # Documentation and runbooks
    └── .github/workflows/  # CI/CD pipelines

## Quick Start

    ./scripts/moto-up.sh
    aws configure --profile moto   # test / test / us-east-1 / json
    aws --profile moto --endpoint-url=http://localhost:5000 s3 ls
    ./scripts/moto-down.sh

## Design Decisions

- MotoServer over LocalStack: LocalStack Community Edition gates ELBv2 and RDS behind a Pro license; Moto provides them free and open-source.
- The same Terraform modules can target real AWS by switching credentials and endpoints.

## Status

In active development
