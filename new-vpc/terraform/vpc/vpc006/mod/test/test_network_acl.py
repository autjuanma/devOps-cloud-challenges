import boto3

def test_network_acl_configuration():
    # Get the network ACL ID from the Terraform output
    network_acl_id = boto3.client('terraform').get_output('network_acl_id')['Value']

    # Get the network ACL configuration
    network_acl = boto3.client('ec2').describe_network_acls(NetworkAclIds=[network_acl_id])['NetworkAcls'][0]

    # Check if the network ACL has the correct inbound rule
    assert network_acl['Entries'][0]['RuleNumber'] == 100
    assert network_acl['Entries'][0]['Protocol'] == 'tcp'
    assert network_acl['Entries'][0]['PortRange']['From'] == 22
    assert network_acl['Entries'][0]['PortRange']['To'] == 22
    assert network_acl['Entries'][0]['CidrBlock'] == '0.0.0.0/0'
    assert network_acl['Entries'][0]['RuleAction'] == 'allow'