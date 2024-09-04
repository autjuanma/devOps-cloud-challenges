import boto3

def test_vpc_consistency():
    # Get the VPC IDs from the Terraform output
    vpc_ids = boto3.client('terraform').get_output('vpc_ids')['Value']

    # Check if the VPCs are consistently configured across regions
    for vpc_id in vpc_ids:
        vpc = boto3.client('ec2').describe_vpcs(VpcIds=[vpc_id])['Vpcs'][0]
        assert vpc['CidrBlock'] == '10.0.0.0/16'
        assert vpc['Tags'][0]['Value'] == 'Secure VPC'