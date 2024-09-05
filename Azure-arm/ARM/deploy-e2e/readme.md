============================================================

**Challenge Description**
-------------------------

Create a strong and complete ARM template that deploys a Node.js application with the following requirements:

* Node.js application name: `nodejs-app`
* Cosmos DB account name: `cosmosdb-account`
* Database name: `mydatabase`
* Container name: `mycontainer`
* Location: `East US`
* IP static security:

The ARM template should include the following resources:

* Resource Group
* App Service Plan
* App Service
* Cosmos DB database account
* Cosmos DB database
* Cosmos DB container
* Network Security Group (NSG)
* Virtual Network (VNet)
* Application Insights component

The template should also include firewall rules, IP static security configurations, and monitoring settings to ensure a secure and scalable deployment.

**Deliverables**
---------------

* A complete ARM template file named `nodejs-app-deployment.json` that meets the requirements above
* A brief description of the resources included in the template and their configuration
* A separate file named `variables.json` that contains the variable definitions for the template

**Evaluation Criteria**
-----------------------

* The ARM template should deploy all required resources successfully
* The template should include firewall rules, IP static security configurations, and monitoring settings
* The template should be well-organized, readable, and easy to maintain