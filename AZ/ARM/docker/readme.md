# Challenge: Deploying a Microservices Application using ARM Template
============================================================

## Application Requirements

The application consists of three microservices:

* **orders-service**: a .NET Core web API that handles orders
* **products-service**: a Node.js web API that handles products
* **payment-service**: a Java web API that handles payments

Each microservice should be deployed as a separate container instance in a container group.

## Infrastructure Requirements

The container group should be deployed to a virtual network with a subnet. The virtual network should have a network security group (NSG) that allows inbound traffic on port 80.

## Communication Requirements

The microservices should communicate with each other using a service bus namespace with three topics: orders, products, and payments.

## Storage Requirements

The application should use a PostgreSQL database for storage. The database should be deployed as a separate resource and should have a firewall rule that allows inbound traffic from the container group.

## Monitoring Requirements

The application should be monitored using Azure Monitor with three metrics: orders_processed, products_sold, and payments_processed.

## ARM Template Requirements

The ARM template should use parameters for the following:

* **location**: the location where the resources should be deployed
* **containerGroupName**: the name of the container group
* **ordersServiceImage**: the Docker image for the orders service
* **productsServiceImage**: the Docker image for the products service
* **paymentServiceImage**: the Docker image for the payment service
* **postgreSQLAdminUsername**: the admin username for the PostgreSQL database
* **postgreSQLAdminPassword**: the admin password for the PostgreSQL database
* **serviceBusNamespaceName**: the name of the service bus namespace

The ARM template should use variables for the following:

* **containerGroupResourceId**: the resource ID of the container group
* **postgreSQLServerName**: the name of the PostgreSQL server
* **serviceBusNamespaceResourceId**: the resource ID of the service bus namespace

## Requirements

The ARM template should be written in JSON and should be compatible with Azure Resource Manager (ARM). The template should use the latest available API versions for each resource type. The template should be parameterized to allow for easy customization. The template should use variables to simplify the template and reduce repetition. The template should include all necessary resources and configuration to deploy the microservices application.

## Deliverables

* A complete ARM template in JSON format
* A parameters file in JSON format with sample values for each parameter
* A brief explanation of the template and how it works

## Deploy 🚀
To deploy the solution, follow these steps:

1️⃣ Create a new resource group in Azure using the Azure CLI or Azure Portal 📊 2️⃣ Create a new Azure Container Registry (ACR) in the resource group 📦 3️⃣ Create a new Azure Service Bus namespace in the resource group 🚌

Let me know if you want me to add the rest of the steps! 😊