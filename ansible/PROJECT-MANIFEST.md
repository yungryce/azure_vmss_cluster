# Project Manifest: Kubernetes Automation with Ansible

## Project Identity
- **Name**: VMSS Kubernetes Configuration
- **Type**: Configuration Management
- **Scope**: System Configuration and Kubernetes Deployment
- **Status**: Production-Ready

## Technology Signature
- **Core**: Ansible 2.9+
- **Runtime**: Python 3.8+
- **Target Systems**: Ubuntu 22.04 LTS on Azure VMSS
- **Dependencies**: Terraform outputs (/terraform/terraform_outputs.json)
- **Components**:
  - Kubernetes 1.24+
  - Containerd 1.6+
  - Flux CD 2.0
  - Flannel CNI

## Demonstrated Competencies
- Configuration Automation
- Cluster Administration
- GitOps Implementation
- Dynamic Inventory Management
- Continuous Deployment
- Idempotent System Configuration
- Container Runtime Setup
- Security Hardening
- Error Detection and Recovery
- Integration with Infrastructure as Code

## System Context
This component consumes infrastructure outputs from Terraform and configures the VMSS instances to operate as a Kubernetes cluster. It bridges the gap between raw infrastructure and application platform, preparing the system for GitOps-based deployment workflows.

## Deployment Requirements
- Python 3.8+ environment
- Access to Azure API
- SSH access to VMSS instances
- Terraform outputs JSON file

## Development Workflow
1. Testing in development environment
2. Execution against staging instances
3. Production deployment with validation checks
4. Integration testing of deployed Kubernetes cluster

## Maintenance Notes
- Dynamic inventory refreshes on each run to capture VMSS scaling events
- SSH keys are retrieved from Azure Key Vault
- Role execution follows explicit dependency order
- Error handling includes retries for transient failures
- Logging provides detailed execution information

## Implementation Specifics

### Configuration Management
- **Dynamic Inventory**: [azure_vmss_inventory.py](./azure_vmss_inventory.py)
- **Idempotent Operations**: [playbook.yml](./playbook.yml)

### Kubernetes Setup
- **Container Runtime Installation**: [roles/containerd/tasks/main.yml](./roles/containerd/tasks/main.yml)
- **Cluster Bootstrapping**: [roles/kubernetes/tasks/main.yml](./roles/kubernetes/tasks/main.yml)

### Security Hardening
- **Pod Security Policies**: [roles/kubernetes/templates/policies.yml.j2](./roles/kubernetes/templates/policies.yml.j2)
- **SSH Hardening**: [roles/common/tasks/ssh.yml](./roles/common/tasks/ssh.yml)

### Error Handling
- **Failure Detection**: [playbook.yml](./playbook.yml#L15-L25)
- **Retry Logic**: [roles/kubernetes/tasks/join.yml](./roles/kubernetes/tasks/join.yml#L10-L15)