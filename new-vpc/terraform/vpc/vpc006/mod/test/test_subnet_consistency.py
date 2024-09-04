import boto3

def test_subnet_consistency():
    # Get the subnet IDs from the Terraform output
    subnet_ids = boto3.client('terraform').get_output('subnet_ids')['Value']

    # Check if the