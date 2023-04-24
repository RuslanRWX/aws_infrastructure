#!/bin/bash

yum install amazon-cloudwatch-agent -y;
mkdir -p /usr/share/collectd;
touch /usr/share/collectd/types.db;
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:AmazonCloudWatch-linux -s;