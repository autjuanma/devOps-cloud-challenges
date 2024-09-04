import boto3

def test_cloudwatch_log_group():
    # Get the log group ARN from the Terraform output
    log_group_arn = boto3.client('terraform').get_output('log_group_arn')['Value']

    # Get the log group configuration
    log_group = boto3.client('cloudwatch').describe_log_groups(logGroupNamePrefix=log_group_arn)['logGroups'][0]

    # Check if the log group has the correct name
    assert log_group['logGroupName'] == 'my-log-group'