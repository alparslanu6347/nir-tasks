terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.56.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "codility"
  location = "West Europe"
}

resource "azurerm_storage_account" "upload_storage_account" {
  name                     = "uploadstorageaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "upload_container" {
  name                  = "upload-container"
  storage_account_name  = azurerm_storage_account.upload_storage_account.name
  container_access_type = "blob"
}

resource "azurerm_servicebus_namespace" "upload_queue_ns" {
  name                = "upload-queue-ns"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "upload_queue" {
  name         = "upload-queue"
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name = azurerm_servicebus_namespace.upload_queue_ns.name
  enable_partitioning = true
}

resource "azurerm_eventgrid_event_subscription" "upload_subscription" {
  name  = "upload-event-subscription"
  scope = azurerm_resource_group.rg.id

  storage_queue_endpoint {
    storage_account_id = azurerm_storage_account.upload_storage_account.id
    queue_name         = azurerm_servicebus_queue.upload_queue.name
  }

  included_event_types = [
    "Microsoft.Storage.BlobCreated",
  ]

}



