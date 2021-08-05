provider "azurerm" {
  features {}
  version = "=2.46.0"
  subscription_id = "a86613d2-d648-454a-b054-8ab69379cc63"
  client_id       = "43552c1d-d154-453f-a7b8-42c6640d2483"
  client_secret   = "~x_1Q_KHGGW7tm24j~qC1JlzBHuy2ly4iH"
  tenant_id       = "8f2deb64-b8c8-42bb-af8e-40c5124a345b"
}
terraform {
  backend "azurerm" {
    storage_account_name = "srinikastorageaccount"
    container_name       = "container1"
    key                  = "terraform.tfstate"
    access_key = "mFq6Ea5wSS6a+LXN4UNxoWE9uIbaH67cJgu226S6agbvxPeiIio50asGpe6Nt7MevCNDMAuxq71wA9JaAvymSQ=="
  }
}
resource "azurerm_resource_group" "example" {
  name     = "piprgs"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "PublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_managed_disk" "example" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}