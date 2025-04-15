## Main Project README

# Azure VMSS Kubernetes Cluster with GitOps

A complete solution for deploying and managing a production-ready Kubernetes cluster on Azure Virtual Machine Scale Sets with GitOps-based continuous deployment.

## Technology Signature

### Infrastructure
- **Terraform 1.0+**
- **Azure Resources**: VMSS, Load Balancer, VNet, NSG, Key Vault

### Configuration Management
- **Ansible 2.9+**
- **Python 3.8+**
- **Azure CLI 2.30+**

### Runtime Platform
- **Kubernetes 1.24+**
- **Containerd 1.6+**
- **Flannel CNI**

### Continuous Deployment
- **Flux CD 2.0**
- **Git-based operations**

## System Architecture

This project implements a full DevOps lifecycle:

1. **Infrastructure Provisioning** (Terraform)
   - VMSS with Ubuntu 22.04
   - Network security and load balancing
   - Key management via Key Vault

2. **Configuration Management** (Ansible)
   - Dynamic inventory from Terraform outputs
   - Structured playbooks for component setup
   - Role-based node configuration

3. **Platform Setup**
   - Kubernetes control plane and worker nodes
   - Container runtime configuration
   - Network policies and overlay

4. **Continuous Deployment**
   - GitOps workflow with Flux CD
   - Repository-driven configuration
   - Automated reconciliation

## Deployment Workflow

Terraform → Terraform Outputs → Ansible Inventory → Ansible Playbooks → Kubernetes Cluster → Flux CD → GitOps

1. Run `terraform.sh` to provision infrastructure and generate outputs
2. Execute `azure_vmss_inventory.py` to create dynamic Ansible inventory
3. Apply Ansible playbooks to configure nodes and establish Kubernetes cluster
4. Deploy Flux CD for GitOps-based continuous deployment
5. Manage applications and configurations through Git repositories

## Security Features

- Managed identities for Azure resource access
- SSH key automation with Key Vault storage
- Network segmentation with NSG rules
- VNet peering for secure communication
- Role-based access control throughout the stack

## Demonstrated Competencies

- **Infrastructure as Code**: Automated cloud resource provisioning
- **Configuration Management**: Systematic node setup and maintenance
- **Container Orchestration**: Kubernetes cluster deployment and administration
- **GitOps Practices**: Continuous deployment with declarative configurations
- **Cloud Security**: Identity management, network isolation, and access control
- **Automation Engineering**: End-to-end workflow integration

## Project Structure

- `/terraform`: Infrastructure as Code resources
- `/ansible`: Configuration management playbooks
  - `/common`: Base system setup
  - `/containerd`: Container runtime configuration
  - `/kubernetes`: Cluster deployment
  - `/flux`: GitOps setup
  - `/gitops`: Kubernetes manifests managed by Flux
- `/private`: Private scripts and credentials (not committed)

## Getting Started

```bash
# Clone repository
git clone https://github.com/yourusername/azure_vmss_cluster.git
cd azure_vmss_cluster

# Deploy infrastructure
cd terraform
[terraform.sh](http://_vscodecontentref_/1)

# Configure cluster
cd ../ansible
python [azure_vmss_inventory.py](http://_vscodecontentref_/2)
ansible-playbook -i [azure_vmss_inventory.json](http://_vscodecontentref_/3) site.yml
```

## Contribution Guidelines

1. Fork the repository
2. Create feature branch
3. Submit pull request with detailed description
4. Ensure CI/CD pipeline passes all tests

## License

This project is licensed under the terms of the license found in the [LICENSE](LICENSE.txt) file.