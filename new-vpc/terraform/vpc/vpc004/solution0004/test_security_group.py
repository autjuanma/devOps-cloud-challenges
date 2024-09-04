import boto3

def test_security_group_configuration():
    # Get the security group ID from the Terraform output
    security_group_id = boto3.client('terraform').get_output('security_group_id')['Value']

    # Get the security group configuration
    security_group = boto3.client('ec2').describe_security_groups(GroupIds=[security_group_id])['SecurityGroups'][0]

    # Check if the security group has the correct inbound rule
    assert security_group['IpPermissions'][0]['FromPort'] == 22
    assert security_group['IpPermissions'][0]['ToPort'] == 22
    assert security_group['IpPermissions'][0]['Ip