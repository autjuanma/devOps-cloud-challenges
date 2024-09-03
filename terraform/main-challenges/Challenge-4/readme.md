## Challenge 4: Resource Dependencies 📈
-------------------------------------

Create a Terraform configuration that provisions the following resources:

* An SNS topic named `my-topic`
* An SQS queue named `my-queue`
* An S3 bucket named `my-bucket` (same as in Challenge 2)
* A Lambda function named `my-lambda` with the following specifications:
	+ Runtime: `nodejs14.x`
	+ Handler: `index.handler`
	+ Environment variables: `BUCKET_NAME=my-bucket`, `QUEUE_URL=my-queue`
	+ Trigger: the SNS topic created above
The Lambda function should be deployed to the `us-west-2` region.