package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestVariables(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	region := terraform.Output(t, terraformOptions, "region")
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")
	subnetCidr := terraform.Output(t, terraformOptions, "subnet_cidr")
	instanceType := terraform.Output(t, terraformOptions, "instance_type")
	sshKeyName := terraform.Output(t, terraformOptions, "ssh_key_name")
	kmsKeyAlias := terraform.Output(t, terraformOptions, "kms_key_alias")
	nmapContainerIP := terraform.Output(t, terraformOptions, "nmap_container_ip")
	wiresharkContainerIP := terraform.Output(t, terraformOptions, "wireshark_container_ip")

	if region != "us-west-2" {
		t.Errorf("Expected region to be 'us-west-2', but got: %s", region)
	}

	if vpcCidr != "10.0.0.0/16" {
		t.Errorf("Expected VPC CIDR to be '10.0.0.0/16', but got: %s", vpcCidr)
	}

	if subnetCidr != "10.0.1.0/24" {
		t.Errorf("Expected subnet CIDR to be '10.0.1.0/24', but got: %s", subnetCidr)
	}

	if instanceType != "t2.micro" {
		t.Errorf("Expected instance type to be 't2.micro', but got: %s", instanceType)
	}

	if sshKeyName != "my_ssh_key" {
		t.Errorf("Expected SSH key name to be 'my_ssh_key', but got: %s", sshKeyName)
	}

	if kmsKeyAlias != "my_kms_key" {
		t.Errorf("Expected KMS key alias to be 'my_kms_key', but got: %s", kmsKeyAlias)
	}

	if nmapContainerIP == "" {
		t.Errorf("Expected Nmap container IP to be non-empty, but got: %s", nmapContainerIP)
	}

	if wiresharkContainerIP == "" {
		t.Errorf("Expected Wireshark container IP to be non-empty, but got: %s", wiresharkContainerIP)
	}
}