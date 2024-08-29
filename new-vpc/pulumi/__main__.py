import pulumi
import pulumi_awsx as awsx

# Create a new VPC with a CIDR block that supports at least 60,000 hosts
vpc = awsx.ec2.Vpc("exercise-vpc",
    cidr_block="10.0.0.0/16",
    tags={
        "Name": "exercise-vpc",
        "Environment": "exercise"
    }
)

# Export the VPC ID, public subnet IDs, and private subnet IDs
pulumi.export("vpc_id", vpc.vpc_id)
pulumi.export("public_subnet_ids", vpc.public_subnet_ids)
pulumi.export("private_subnet_ids", vpc.private_subnet_ids)

# You can also export other useful properties, such as the VPC CIDR block
pulumi.export("vpc_cidr_block", vpc.cidr_block)