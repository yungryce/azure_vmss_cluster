# Skills Index

This document maps specific technical skills to their implementations within this project.

## Infrastructure Architecture
- **VNet Peering Configuration**: [terraform/main.tf](./terraform/main.tf#L85-L95)
- **Load Balancer Setup**: [terraform/main.tf](./terraform/main.tf#L55-L65)

## Security Implementation
- **Managed Identity**: [terraform/ssh.tf](./terraform/ssh.tf#L10-L25)
- **SSH Key Automation**: [terraform/ssh.tf](./terraform/ssh.tf#L30-L45)

## Kubernetes Administration
- **Control Plane Setup**: [ansible/kubernetes/master.yml](./ansible/kubernetes/master.yml)
- **CNI Configuration**: [ansible/kubernetes/flannel.yml](./ansible/kubernetes/flannel.yml)

## GitOps Patterns
- **Flux Installation**: [ansible/flux/install_flux.yml](./ansible/flux/install_flux.yml)
- **Repository Structure**: [ansible/gitops/](./ansible/gitops/)