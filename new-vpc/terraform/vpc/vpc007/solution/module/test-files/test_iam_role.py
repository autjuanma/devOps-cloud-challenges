import boto3

def test_iam_role():
    # Get the IAM role ARN from the Terraform output
    iam_role_arn = boto3.client('terraform').get_output('iam_role_arn')['Value']

    # Get the IAM role configuration
    iam_role = boto3.client('iam').get_role(RoleName=iam_role_arn)['Role']

    # Check if the IAM role has the correct name and description
    assert iam_role['RoleName'] == 'my-log-role'
    assert iam_role['Description'] == 'Role for CloudWatch logs'