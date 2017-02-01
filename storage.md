#Azure Storage

Use naming convention

dxhackwinsvr01st

1. Create a Storage Account

Storage account will be for creating a data disk that will be attached to a VM

```Shell
az storage account create -g dx-hacks-rg -n dxhackswinsvr01st -l southeastasia 
--sku Standard_LRS --tags project:dxhacks 
```
