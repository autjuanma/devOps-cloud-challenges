import boto3

def test_cloudwatch_metric():
    # Get the metric ARN from the Terraform output
    metric_arn = boto3.client('terraform').get_output('metric_arn')['Value']

    # Get the metric configuration
    metric = boto3.client('cloudwatch').get_metric_statistics(Namespace='MyNamespace', MetricName='my-metric')['Datapoints'][0]

    # Check if the metric has the correct name and namespace
    assert metric['MetricName'] == 'my-metric'
    assert metric['Namespace'] == 'MyNamespace'