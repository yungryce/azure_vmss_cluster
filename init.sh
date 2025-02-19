#!/bin/bash

set -e  # Exit on any error

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print step headers
print_step() {
    echo -e "\n${GREEN}=== $1 ===${NC}\n"
}

# Function to check command status
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Success: $1${NC}"
    else
        echo -e "${RED}✗ Failed: $1${NC}"
        exit 1
    fi
}

# Change to terraform directory
print_step "Changing to terraform directory"
cd "$(dirname "$0")/terraform"
check_status "Changed to terraform directory"

# Remove state entries
print_step "Removing state entries"
terraform state rm azurerm_virtual_network.vnet_ubuntu
terraform state rm azurerm_key_vault.vmss_ubuntu_vault
check_status "State entries removed"

# Destroy existing infrastructure
print_step "Destroying existing infrastructure"
terraform destroy -auto-approve
check_status "Infrastructure destroyed"

# Import existing resources
print_step "Importing existing resources"
terraform import azurerm_virtual_network.vnet_ubuntu \
    "/subscriptions/105a58e6-5ddb-4fca-a952-fc0f81314fdc/resourceGroups/ubuntu-resources/providers/Microsoft.Network/virtualNetworks/ubuntu22-vnet"
check_status "VNet imported"

terraform import azurerm_key_vault.vmss_ubuntu_vault \
    "/subscriptions/105a58e6-5ddb-4fca-a952-fc0f81314fdc/resourceGroups/ubuntu-resources/providers/Microsoft.KeyVault/vaults/vmss-ubuntu-vault"
check_status "Key Vault imported"

# Initialize and upgrade terraform
print_step "Initializing Terraform"
terraform init -upgrade
check_status "Terraform initialized"

# Apply terraform configuration
print_step "Applying Terraform configuration"
terraform apply -auto-approve
check_status "Infrastructure applied"

# Export terraform outputs
print_step "Exporting Terraform outputs"
terraform output -json > terraform_outputs.json
check_status "Outputs exported"

# Change to ansible directory and run playbook
print_step "Running Ansible playbook"
cd ../ansible
chmod +x azure_vmss_inventory.py
./azure_vmss_inventory.py
check_status "Inventory generated"

ansible-playbook -i azure_vmss_inventory.json playbook.yml --vault-password-file .env
check_status "Ansible playbook completed"

print_step "Deployment completed successfully"