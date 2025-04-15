# Azure VMSS Cluster - Terraform

This directory contains Terraform Infrastructure as Code (IaC) for deploying an Azure Virtual Machine Scale Set (VMSS) cluster with load balancing capabilities.

## Technology Signature

- **Terraform 1.0+**
- **Azure Provider ~>3.0**
- **Azure API Provider ~>1.5**
- **Random Provider ~>3.0**

## Resources Deployed

- Virtual Machine Scale Set with Ubuntu 22.04 LTS
- Azure Load Balancer with public IP
- Virtual Network with peering configuration
- Network Security Groups with SSH and HTTP rules
- Azure Key Vault for storing SSH keys
- System-assigned Managed Identity for VMSS

## Security Features

- Spot instance configuration for cost optimization
- Network security rules limiting SSH access
- VNet peering for secure communication
- Managed SSH key generation and secure storage in Key Vault
- RBAC role assignments for controlled access to resources

## Architecture Context

This Terraform configuration creates the infrastructure backbone for a Kubernetes cluster that will be configured by Ansible. Key components:

1. **Networking**: VNet with subnet and NSG for controlled access
2. **Compute**: Linux VMSS with Ubuntu 22.04 instances
3. **Access Management**: SSH key management via Azure Key Vault
4. **Load Distribution**: Azure Load Balancer for traffic distribution

## Usage

```bash
# Initialize terraform
terraform init

# Create execution plan
terraform plan -out=main.tfplan

# Apply the plan
terraform apply main.tfplan

# Export outputs for Ansible
terraform output -json > terraform_outputs.json
```

## Output Artifacts

The `terraform_outputs.json` file contains critical information including:
- Resource group name
- VMSS name
- Key Vault name
- Secret names for SSH keys

This output is consumed by the Ansible configuration to dynamically build inventory.

## Demonstrated Competencies

- Azure IaC Deployment
- Managed Identity Configuration
- Virtual Network Security Design
- Resource Scaling Architecture
- Infrastructure State Management
- SSH Key Automation