# Azure VMSS Cluster with Terraform, Ansible, and Flux

## Project Overview

This project implements a robust DevOps pipeline using Terraform, Ansible, and Flux (GitOps) on Azure. It deploys a Virtual Machine Scale Set (VMSS) on Azure, configures it with Ansible, and uses Kubernetes with Flux for GitOps-based cluster management and application deployment.

## Key Features

- Infrastructure as Code (IaC) with Terraform
- Configuration management with Ansible
- GitOps-based continuous deployment with Flux
- Kubernetes cluster management
- Multi-environment support (Development, Staging, Production)
- Automated setup of GitOps directory structure

## Prerequisites

- Terraform
- Ansible
- Kubernetes CLI (kubectl)
- Flux CLI
- Azure CLI or Azure PowerShell
- Git

## Getting Started

1. Clone this repository:
   ```
   git clone https://github.com/yungryce/azure_vmss_cluster.git
   cd azure_vmss_cluster
   ```

2. Set up your Azure credentials and configure your Azure CLI.

3. Initialize Terraform:
   ```
   cd terraform
   terraform init
   ```

4. Apply the Terraform configuration:
   ```
   terraform apply
   ```
   You'll be prompted to provide values for:
   - `prefix`: A prefix for your Azure resources
   - `location`: The Azure region to deploy to
   - `subscription_id`: Your Azure subscription ID

5. Once the VMSS is deployed, configure SSH access to the Ubuntu 22 VM.

6. Install Ansible on the VMSS nodes:
   ```
   ansible-playbook -i azure_vmss_inventory.py playbook.yml
   ```

7. The Ansible playbook will:
   - Set up the Kubernetes cluster
   - Install and configure Flux
   - Bootstrap the GitOps structure

8. Verify the Flux installation:
   ```
   flux check
   ```

## Project Structure

- `ansible/`: Ansible configuration files, playbooks, and roles
- `gitops/`: GitOps directory structure for Flux
  - `apps/`: Application manifests
  - `infrastructure/`: Infrastructure manifests
  - `clusters/`: Cluster-specific configurations
- `terraform/`: Terraform configuration files

## GitOps Workflow

This project uses Flux for GitOps-based continuous deployment. The GitOps directory structure is automatically set up, including:

- Base configurations for apps and infrastructure
- Environment-specific overlays (Development, Staging, Production)
- Flux system configurations

## Next Steps

- Customize the GitOps structure for your specific applications
- Implement CI/CD pipelines for your application code
- Enhance monitoring and logging capabilities

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms of the license found in the [LICENSE](LICENSE.txt) file.
```
