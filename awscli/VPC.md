### Создание впс
команда aws ec2 create-vpc

> vladlen@vladlen-VirtualBox:~$ aws ec2 create-vpc --cidr-block 192.168.0.0/16

<details>
<summary>Command output</summary>
  
```
{
    "Vpc": {
        "CidrBlock": "192.168.0.0/16",
        "DhcpOptionsId": "dopt-0d147e6c05308fa6b",
        "State": "pending",
        "VpcId": "vpc-0c28fade9a09625b8",
        "OwnerId": "806159615902",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-021c1b325cc405ce9",
                "CidrBlock": "192.168.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}
```
  
</details>

### Создание сабнета 1
команда aws ec2 create-subnet

> vladlen@vladlen-VirtualBox:~$ aws ec2 create-subnet --vpc-id vpc-0c28fade9a09625b8 --cidr-block 192.168.1.0/24

<details>
<summary>Command output</summary>
  
```
{
    "Subnet": {
        "AvailabilityZone": "us-east-1f",
        "AvailabilityZoneId": "use1-az5",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "192.168.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-01f8b7cc38789c815",
        "VpcId": "vpc-0c28fade9a09625b8",
        "OwnerId": "806159615902",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:us-east-1:806159615902:subnet/subnet-01f8b7cc38789c815",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
```
  
</details>

### Создание сабнета 2
команда aws ec2 create-subnet
vladlen@vladlen-VirtualBox:~$ aws ec2 create-subnet --vpc-id vpc-0c28fade9a09625b8 --cidr-block 192.168.2.0/24

<details>
<summary>Command output</summary>
  
```
{
    "Subnet": {
        "AvailabilityZone": "us-east-1f",
        "AvailabilityZoneId": "use1-az5",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "192.168.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-03413c79ff2fc0a9c",
        "VpcId": "vpc-0c28fade9a09625b8",
        "OwnerId": "806159615902",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:us-east-1:806159615902:subnet/subnet-03413c79ff2fc0a9c",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
<details>
<summary>Command output</summary>
  
```
### Создание таблицы навигации
команда aws ec2 create-route-table

> vladlen@vladlen-VirtualBox:~$ aws ec2 create-route-table --vpc-id vpc-0c28fade9a09625b8 
<details>
<summary>Command output</summary>
  
```
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0f13ca09fee731a82",
        "Routes": [
            {
                "DestinationCidrBlock": "192.168.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0c28fade9a09625b8",
        "OwnerId": "806159615902"
    }
}
```
  
</details>

### Создание гейтвейта
команда aws ec2 create-internet-gateway 

> vladlen@vladlen-VirtualBox:~$ aws ec2 create-internet-gateway 

<details>
<summary>Command output</summary>
  
```
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-083387be5b9ec40ae",
        "OwnerId": "806159615902",
        "Tags": []
    }
}
```
  
</details>

### Привязка гейтвейта к впн
команда aws ec2 attach-internet-gateway

> vladlen@vladlen-VirtualBox:~$ aws ec2 attach-internet-gateway --internet-gateway-id igw-083387be5b9ec40ae --vpc-id vpc-0c28fade9a09625b8 

### Создание группы безопасности
команда  aws ec2 create-security-group

> vladlen@vladlen-VirtualBox:~$ aws ec2 create-security-group --group-name sgAA --description "Security Group A" --vpc-id vpc-0c28fade9a09625b8 

<details>
<summary>Command output</summary>
  
```
{
    "GroupId": "sg-0d563e90381838e01"
}
```
  
</details>

### Добавление правила в ГП --port 22 --cidr 0.0.0.0/0
команда aws ec2 authorize-security-group-ingress

> vladlen@vladlen-VirtualBox:~$ aws ec2 authorize-security-group-ingress --group-id sg-0d563e90381838e01 --protocol tcp --port 22 --cidr 0.0.0.0/0 

<details>
<summary>Command output</summary>
  
```
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-08a22bd61a1cc2175",
            "GroupId": "sg-0d563e90381838e01",
            "GroupOwnerId": "806159615902",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "0.0.0.0/0"
        }
    ]
}
```
  
</details>

### Добавление правила в ГП --port 80 --cidr 0.0.0.0/0
команда aws ec2 authorize-security-group-ingress

> vladlen@vladlen-VirtualBox:~$ aws ec2 authorize-security-group-ingress --group-id sg-0d563e90381838e01 --protocol tcp --port 80 --cidr 0.0.0.0/0 

<details>
<summary>Command output</summary>
  
```
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0cd4f3ca236d3b0ff",
            "GroupId": "sg-0d563e90381838e01",
            "GroupOwnerId": "806159615902",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 80,
            "ToPort": 80,
            "CidrIpv4": "0.0.0.0/0"
        }
    ]
}
```
  
</details>

### Добавление сабнета 1 в таблицу
команда aws ec2 associate-route-table

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ aws ec2 associate-route-table --subnet-id subnet-03413c79ff2fc0a9c --route-table-id rtb-0ec963333085160d4 

<details>
<summary>Command output</summary>
  
```
{
    "AssociationId": "rtbassoc-02f395c20b09399c8",
    "AssociationState": {
        "State": "associated"
    }
}

```
  
</details>

### Добавление сабнета 2 в таблицу
команда aws ec2 associate-route-table

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ aws ec2 associate-route-table --subnet-id subnet-03413c79ff2fc0a9c --route-table-id rtb-0ec963333085160d4 

<details>
<summary>Command output</summary>
  
```
{
    "AssociationId": "rtbassoc-02f395c20b09399c8",
    "AssociationState": {
        "State": "associated"
    }
}
```
  
</details>

### Добавление гейтвейта 1 в таблицу навигации с правилом подключения
команда aws ec2 create-route

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ aws ec2 create-route --route-table-id rtb-0ec963333085160d4 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-083387be5b9ec40ae 

<details>
<summary>Command output</summary>
  
```
{
    "Return": true
}
```
  
</details>

### Создание инстанса
Команда aws ec2 run-instances

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ aws ec2 run-instances --image-id ami-03a6eaae9938c858c --subnet-id subnet-01f8b7cc38789c815 --instance-type t2.micro --key-name KeyIntatceA --security-group-ids sg-0d563e90381838e01 

<details>
<summary>Command output</summary>
  
```
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03a6eaae9938c858c",
            "InstanceId": "i-02ffbec414e1944f9",
            "InstanceType": "t2.micro",
            "KeyName": "KeyIntatceA",
            "LaunchTime": "2023-10-02T13:56:33.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1f",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-192-168-1-124.ec2.internal",
            "PrivateIpAddress": "192.168.1.124",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-01f8b7cc38789c815",
            "VpcId": "vpc-0c28fade9a09625b8",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "1bf14574-2cc4-40d5-bd54-2bb79580ac68",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2023-10-02T13:56:33.000Z",
                        "AttachmentId": "eni-attach-0b15620c97a32dea1",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "sgAA",
                            "GroupId": "sg-0d563e90381838e01"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "16:7e:0e:c2:39:35",
                    "NetworkInterfaceId": "eni-0b49cbc8aa0819225",
                    "OwnerId": "806159615902",
                    "PrivateIpAddress": "192.168.1.124",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.1.124"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-01f8b7cc38789c815",
                    "VpcId": "vpc-0c28fade9a09625b8",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "sgAA",
                    "GroupId": "sg-0d563e90381838e01"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "required",
                "HttpPutResponseHopLimit": 2,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": true,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    ],
    "OwnerId": "806159615902",
    "ReservationId": "r-07947b0176e3d0024"
}
```
  
</details>

### Создание инстанса
команда aws ec2 run-instances

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ aws ec2 run-instances --image-id ami-03a6eaae9938c858c --subnet-id subnet-03413c79ff2fc0a9c --instance-type t2.micro --key-name KeyIntatceA --security-group-ids sg-0d563e90381838e01 

<details>
<summary>Command output</summary>
  
```
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03a6eaae9938c858c",
            "InstanceId": "i-0de35954ffa56d96a",
            "InstanceType": "t2.micro",
            "KeyName": "KeyIntatceA",
            "LaunchTime": "2023-10-02T13:57:00.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1f",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-192-168-2-211.ec2.internal",
            "PrivateIpAddress": "192.168.2.211",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-03413c79ff2fc0a9c",
            "VpcId": "vpc-0c28fade9a09625b8",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "df8d4eb1-012e-4a51-a178-b14b2493cfbf",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2023-10-02T13:57:00.000Z",
                        "AttachmentId": "eni-attach-03731a2b77297832f",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "sgAA",
                            "GroupId": "sg-0d563e90381838e01"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "16:57:c3:70:6f:05",
                    "NetworkInterfaceId": "eni-0efd9ca0636a8f845",
                    "OwnerId": "806159615902",
                    "PrivateIpAddress": "192.168.2.211",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.2.211"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-03413c79ff2fc0a9c",
                    "VpcId": "vpc-0c28fade9a09625b8",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "sgAA",
                    "GroupId": "sg-0d563e90381838e01"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "required",
                "HttpPutResponseHopLimit": 2,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": true,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    ],
    "OwnerId": "806159615902",
    "ReservationId": "r-09627cdaae2ec642e"
}
```
  
</details>

### Джамп на сервер Б
команда ssh

> vladlen@vladlen-VirtualBox:~/vladlen-bondarchuk/awscli$ ssh -i "KeyIntatceA.pem" -J ec2-user@3.236.141.227  ec2-user@192.168.2.211 

<details>
<summary>Command output</summary>
  
```
The authenticity of host '192.168.2.211 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:6Mu5K0mCUePmUZJC6d8KkszeyVCRV/M33mmiOwiqi4o.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.2.211' (ED25519) to the list of known hosts.
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
[ec2-user@ip-192-168-2-211 ~]$ 
```
  
</details>

