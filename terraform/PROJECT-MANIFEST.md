# Project Manifest: Azure VMSS Terraform Infrastructure

## Project Identity
- **Name**: Azure VMSS Infrastructure
- **Type**: Infrastructure as Code (IaC)
- **Scope**: Cloud Resource Provisioning
- **Status**: Production-Ready

## Technology Signature
- **Core**: Terraform 1.0+
- **Providers**: 
  - Azure Provider ~>3.0
  - Azure API Provider ~>1.5
- **State Storage**: Azure Storage Account
- **Authentication**: Service Principal with RBAC
- **Security Features**: Managed Identities, Network Security Groups, Key Vault integration

## Demonstrated Competencies
- Cloud Resource Provisioning
- Network Architecture Design
- Security Posture Management
- State Management
- Resource Templating
- Infrastructure Modularization
- Variable Management for Multiple Environments
- Secure Data Handling
- Output Generation for Downstream Systems

## System Context
This component serves as the foundation for the entire VMSS Kubernetes cluster, provisioning all required infrastructure before configuration management takes over. It creates all Azure resources and exports necessary information for Ansible to configure the virtual machines.

## Deployment Requirements
- Azure Subscription
- Contributor RBAC role
- Service Principal credentials
- Storage Account for Terraform state

## Development Workflow
1. Local development using Terraform CLI
2. Testing with terraform plan
3. Deployment with terraform apply
4. Output generation for configuration management

## Maintenance Notes
- State locking is implemented to prevent concurrent modifications
- Sensitive variables are marked and protected
- Infrastructure changes should follow the PR process
- Regular terraform plan reviews for drift detection
- Outputs are structured for consumption by Ansible
# Project Manifest: Azure VMSS Terraform

## Project Type
Infrastructure as Code (IaC)

## Dependencies
- None (root level infrastructure)

## Primary Technologies
- Terraform 1.0+
- Azure Provider ~>3.0
- Azure API Provider ~>1.5

## Demonstrated Skills
- Cloud Resource Provisioning
- Network Architecture Design
- Security Posture Management
- State Management
- Resource Templating