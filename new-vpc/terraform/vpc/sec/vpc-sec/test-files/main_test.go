package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformConfig(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	instancePublicIP := terraform.Output(t, terraformOptions, "instance_public_ip")
	instancePrivateIP := terraform.Output(t, terraformOptions, "instance_private_ip")

	if instancePublicIP == "" {
		t.Errorf("Expected instance public IP to be non-empty, but got: %s", instancePublicIP)
	}

	if instancePrivateIP == "" {
		t.Errorf("Expected instance private IP to be non-empty, but got: %s", instancePrivateIP)
	}
}