# Architecture Diagram

```mermaid
graph TD
    A[Terraform] -->|generates| B[Infrastructure]
    B -->|outputs| C[terraform_outputs.json]
    C -->|consumed by| D[azure_vmss_inventory.py]
    D -->|creates| E[azure_vmss_inventory.json]
    E -->|used by| F[Ansible Playbooks]
    F -->|configures| G[Kubernetes Cluster]
    G -->|managed by| H[Flux CD]
    H -->|watches| I[Git Repository]
    I -->|contains| J[gitops manifests]