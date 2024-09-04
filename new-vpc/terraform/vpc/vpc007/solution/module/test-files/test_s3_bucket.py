import boto3

def test_s3_bucket():
    # Get the S3 bucket ARN from the Terraform output
    s3_bucket_arn = boto3.client('terraform').get_output('s3_bucket_arn')['Value']

    # Get the S3 bucket configuration
    s3_bucket = boto3.client('s3').get_bucket_acl(Bucket=s3_bucket_arn)['AccessControlList']

    # Check if the S3 bucket has the correct name and ACL
    assert s3_bucket['Bucket'] == 'my-log-bucket'
    assert s3_bucket['AccessControlList'][0]['Permission'] == 'private'