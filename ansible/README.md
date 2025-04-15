# Azure VMSS Cluster - Ansible

This directory contains Ansible configuration management code for setting up a Kubernetes cluster on Azure VMSS instances.

## Technology Signature

- **Ansible 2.9+**
- **Python 3.8+**
- **Azure CLI 2.30+**
- **Kubernetes 1.24+**
- **Containerd 1.6+**
- **Flux CD 0.30+**

## Components Managed

- Base system configuration
- Container runtime (containerd)
- Kubernetes cluster (master and worker nodes)
- Network overlay (Flannel)
- GitOps with Flux CD

## Dynamic Inventory

The `azure_vmss_inventory.py` script dynamically builds Ansible inventory by:
1. Reading Terraform outputs from `terraform_outputs.json`
2. Querying Azure API for VMSS instance details
3. Retrieving SSH private keys from Azure Key Vault
4. Generating a structured inventory with master/worker roles

## Playbook Structure

- **Common**: Base system configuration applied to all nodes
- **Containerd**: Container runtime installation and configuration
- **Kubernetes**: 
  - `master.yml`: Control plane setup
  - `worker.yml`: Worker node setup and joining cluster
  - `flannel.yml`: Network overlay deployment
- **Flux CD**: 
  - GitOps pipeline configuration
  - Repository connections
  - Continuous deployment setup

## GitOps Integration

The `gitops` directory contains Kubernetes manifests managed by Flux CD, enabling:
- Application deployments
- Configuration management
- Secret handling
- Continuous reconciliation

## Demonstrated Competencies

- Configuration Management Automation
- Dynamic Inventory Generation
- Kubernetes Cluster Administration
- Container Runtime Configuration
- GitOps Workflow Implementation
- Infrastructure Orchestration

## Usage

```bash
# Generate inventory from Terraform outputs
python azure_vmss_inventory.py

# Run full cluster setup
ansible-playbook -i azure_vmss_inventory.json playbook.yml --vault-password-file .env
