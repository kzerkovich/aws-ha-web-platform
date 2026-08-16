# Highly Available Web Platform on AWS

Production-like highly available web platform described with Terraform and validated locally against mocked AWS APIs (MotoServer). Every change is validated in CI before merge.

## Architecture

Rendered diagram: docs/architecture.md

- VPC with public/private subnets across 2 Availability Zones
- Application Load Balancer in public subnets
- Auto Scaling Group with the app in private subnets
- RDS PostgreSQL in private subnets, reachable only from the app
- NAT Gateway for outbound traffic from private subnets
- S3 bucket with encryption and fully blocked public access
- IAM least-privilege role and instance profile for the app
- CloudWatch alarms with SNS email notifications

## Tech Stack

- Terraform (Infrastructure as Code, modularized)
- AWS: VPC, EC2/ASG, ALB, RDS, S3, IAM, CloudWatch, SNS
- MotoServer (local AWS API emulation)
- Docker / Docker Compose
- GitHub Actions (CI/CD)
- Bash (automation)

## Project Structure

    aws-ha-web-platform/
    ├── infra/
    │   ├── modules/        # network, alb, asg, rds, s3, iam, monitoring
    │   ├── environments/   # dev / staging / prod
    │   └── global/
    ├── moto/               # local AWS emulator
    ├── app/                # demo application
    ├── scripts/            # automation scripts
    ├── diagrams/
    ├── docs/               # architecture and runbooks
    └── .github/workflows/  # CI/CD

## Quick Start

    ./scripts/moto-up.sh
    export TF_VAR_db_password=dev-password-123
    cd infra/environments/dev
    terraform init
    terraform plan
    terraform apply
    terraform output

## CI/CD

- On pull request: fmt, init, validate, plan (nothing is applied)
- On merge to main: plan, apply, smoke tests
- Runs against a Moto service container, no real cloud account needed

## Security

- App and database live in private subnets
- Security group chain: internet -> ALB (80/443) -> app (8080) -> db (5432)
- S3: public access blocked, server-side encryption, versioning
- IAM: least-privilege read-only policy for the app bucket
- Secrets are passed via environment variables; terraform state is gitignored

## Design Decisions

- MotoServer instead of LocalStack: LocalStack Community gates ELBv2 and RDS behind a Pro license
- Reusable modules with per-environment configuration (dev/staging/prod)
- Provider is configured at the environment level, keeping modules cloud-agnostic
- The same code targets real AWS by switching credentials and endpoints

## Status

In active development
