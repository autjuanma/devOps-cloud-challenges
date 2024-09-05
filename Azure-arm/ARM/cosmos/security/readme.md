**Azure ARM Challenge: Deploy Node.js App with Cosmos DB and IP Static Security**

**Objective:**
Deploy a Node.js application with a Cosmos DB instance and configure IP static security using an Azure Resource Manager (ARM) template.

 **Challenge:**
Create an ARM template that deploys a Node.js application with the following specifications:

* Node.js application name: `nodejs-app`
* Cosmos DB account name: `cosmosdb-account`
* Database name: `mydatabase`
* Container name: `mycontainer`
* Location: `East US`
* IP static security: allow access only from IP address `192.168.1.100`

**Constraints:**

* Use the `Microsoft.Web/sites` resource type to deploy the Node.js application.
* Use the `Microsoft.DocumentDB/databaseAccounts` resource type to deploy the Cosmos DB account.
* Use the `Microsoft.DocumentDB/databaseAccounts/sqlDatabases` resource type to deploy the database.
* Use the `Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers` resource type to deploy the container.
* Use the `ipRules` property to configure IP static security for the Cosmos DB account.
* Use the `Session` consistency level for the Cosmos DB account.

**Deliverable:**
Provide the complete ARM template file (`*.json`) that meets the challenge specifications.