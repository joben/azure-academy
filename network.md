#Overview
https://docs.microsoft.com/en-us/azure/Virtual-Network/virtual-networks-overview

##Azure Networking for AWS Professionals
(similar to this one from Google https://cloud.google.com/docs/compare/aws/networking)
https://docs.microsoft.com/en-us/azure/guidance/azure-for-aws-professionals
https://docs.microsoft.com/en-us/azure/guidance/guidance-azure-for-aws-professionals-service-map#networking-services

##Before you get started
https://docs.microsoft.com/en-us/azure/guidance/guidance-naming-conventions

itd-dev-vnet

#Hands On
1. Reference Network Design
2. Creating a VNet (CLI)
https://docs.microsoft.com/en-us/azure/Virtual-Network/virtual-networks-create-vnet-arm-cli

```Shell
az network vnet create -n itd-dev-vnet -g itd-sharedservices-rg -l "southeastasia" --address-prefix 192.168.0.0/16 --subnet-name Frontend --subnet-prefix 192.168.1.0/24 --tags "serviceteam:shared services"
```
