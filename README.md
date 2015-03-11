# AWS AMI Test Scripts

A set of very simple scripts, which can be used to first start an AWS EC2 instance based on a specific AMI, then connect to it and clean it up afterwards.

## Dependencies

The [AWS CLI](https://github.com/aws/aws-cli) is required to be [installed](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) and configured.

```
$ sudo pip install awscli
$ aws configure
```

Proper IAM users with sufficient permissions and some preparation on AWS (VPC, subnets, an AMI to test) are assumed.

## Before Usage

You need to insert meaningful values for some variables, otherwise the scripts will not work.

In *skeleton.json* the **KeyName**, **SecurityGroupIds** (default and one which allows SSH access from your machine) and a accessible **SubnetId** need to be specified. Here an image ID can be hardcoded as well, which should not be the case. This file is used in *run_ami_test_instance.sh*.

In *connect_to_instance.sh* the **PEM_KEY_PATH** needs to be changed, to point to the *.pem* key on your local machine, the one you will be using to create the instance in the first place (see skeleton.json **KeyName**).

## Typical Usage

To start an instance, connect to it via SSH and terminate it:

```
# placeholders in square brackets need to be replaced
$ ./connect_to_instance.sh [ami ID here: ami-xxx]
$ ./run_ami_test_instance.sh [instance public IP]
$ ./terminate_instance.sh [instance ID: i-xxx]
```

##License: MIT

Copyright (c) 2015 Vladislav Supalov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
