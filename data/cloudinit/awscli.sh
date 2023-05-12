#!/bin/bash
yum install -y python3-pip
pip3 install awscli
aws configure set default.region eu-central