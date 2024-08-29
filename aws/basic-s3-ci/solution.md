# Basic CI with S3 🚀
=====================

## Objectives 🎯
---------------

1. Create a new S3 bucket 📦
2. Add to the bucket an `index.html` file and make it a static website 📄
3. Create a GitHub repo and put the `index.html` there 📂
4. Make sure to connect your AWS account to GitHub 🔗
5. Create a CI pipeline in AWS to publish the updated `index.html` from GitHub every time someone makes a change to the repo, to a specific branch 🔄

## Solution 💡
--------------

### Manual 🤖
-------------

#### Create S3 bucket 📦
---------------------

1. Go to S3 service in AWS console 📈
2. Insert bucket name and choose region 📍
3. Uncheck "block public access" to make it public 🔓
4. Click on "Create bucket" 👉

#### Static website hosting 📄
-----------------------------

1. Navigate to the newly created bucket and click on "properties" tab 📊
2. Click on "Edit" in "Static Website Hosting" section ✍️
3. Check "Enable" for "Static web hosting" 💻
4. Set `index.html` as index document and `error.html` as error document. 📝

#### S3 bucket permissions 🔒
---------------------------

1. Click on "Permissions" tab in the newly created S3 bucket 🔓
2. Click on Bucket Policy -> Edit -> Policy Generator. Click on "Generate Policy" for "GetObject" 📝
3. Copy the generated policy and go to Permissions tab and replace it with the current policy 📝

#### GitHub Source 📂
---------------------

1. Go to Developers Tools Console and create a new connection (GitHub) 🔗

#### Create a CI pipeline 🔄
-------------------------

1. Go to CodePipeline in AWS console 📈
2. Click on "Create Pipeline" -> Insert a pipeline name -> Click on Next 👉
3. Choose the newly created source (GitHub) under sources 📂
4. Select repository name and branch name 📈
5. Select "AWS CodeBuild" as build provider 🛠️
6. Select "Managed Image", "standard" runtime and "new service role" 📝
7. In deploy stage choose the newly created S3 bucket and for deploy provider choose "Amazon S3" 📦
8. Review the pipeline and click on "Create pipeline" 👉

#### Test the pipeline 🎉
----------------------

1. Clone the project from GitHub 📂
2. Make changes to `index.html` and commit them (`git commit -a`) 💻
3. Push the new change, verify that the newly created AWS pipeline was triggered and check the content of the site 📊