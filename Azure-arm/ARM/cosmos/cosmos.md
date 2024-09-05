**Azure ARM Challenge: Deploy Cosmos DB**

**Objective:**
Deploy a Cosmos DB account, database, and container using an Azure Resource Manager (ARM) template.

 **Challenge:**
Create an ARM template that deploys a Cosmos DB account, database, and container with the following specifications:

* Cosmos DB account name: `cosmosdb-account`
* Database name: `mydatabase`
* Container name: `mycontainer`
* Location: `East US`

**Constraints:**

* Use the `Microsoft.DocumentDB/databaseAccounts` resource type to deploy the Cosmos DB account.
* Use the `Microsoft.DocumentDB/databaseAccounts/sqlDatabases` resource type to deploy the database.
* Use the `Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers` resource type to deploy the container.
* Use the `Session` consistency level for the Cosmos DB account.

**Deliverable:**
Provide the complete ARM template file (`*.json`) that meets the challenge specifications.