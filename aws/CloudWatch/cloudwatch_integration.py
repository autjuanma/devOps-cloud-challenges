import boto3
import json

cloudwatch = boto3.client('cloudwatch')
sns = boto3.client('sns')

def lambda_handler(event, context):
    # Collect data from CloudWatch
    metrics = cloudwatch.get_metric_statistics(
        Namespace='AWS/EC2',
        MetricName='CPUUtilization',
        StartTime=event['startTime'],
        EndTime=event['endTime'],
        Period=300,
        Statistics=['Average']
    )

    # Process and analyze the data
    anomalies = []
    for metric in metrics:
        if metric['Average'] > 80:
            anomalies.append(metric)

    # Send notifications and alerts
    if len(anomalies) > 0:
        sns.publish(
            TopicArn='arn:aws:sns:REGION:ACCOUNT_ID:TOPIC_NAME',
            Message=json.dumps(anomalies)
        )

    # Integrate with CloudWatch (step 4)
    cloudwatch.put_metric_alarm(
        AlarmName='CPUUtilizationAlarm',
        ComparisonOperator='GreaterThanThreshold',
        EvaluationPeriods=1,
        MetricName='CPUUtilization',
        Namespace='AWS/EC2',
        Period=300,
        Statistic='Average',
        Threshold=80,
        Unit='Percent'
    )

    # Monitor and refine (step 5)
    cloudwatch.put_metric_data(
        Namespace='AWS/EC2',
        MetricData=[
            {
                'MetricName': 'AutomationScriptPerformance',
                'Dimensions': [
                    {
                        'Name': 'ScriptName',
                        'Value': 'CPUUtilizationScript'
                    }
                ],
                'Value': 1
            }
        ]
    )

    return {
        'statusCode': 200,
        'statusMessage': 'OK'
    }