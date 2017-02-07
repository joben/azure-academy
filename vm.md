#Creating Virtual Machines on Azure

#How to

1. Checking for available Virtual Machine images 

Check all available Windows Server VM images

```Shell
az vm image list --offer WindowsServer --all
az vm image list --offer WindowsServer --query "[?contains (sku, '2012')]"
```

Create a base Windows Server 2016 VM

```Shell
az vm create -n dev-win-vm01 -g dx-hacks-rg -l southeastasia \
--admin-username joben \
--image MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest \
--size Standard_D11_v2 --storage-account dxhackswinsvr01st  \
--vnet dx-hacks-vnet --subnet-name workstations \
--public-ip-address dxdev01-pip --public-ip-address-dns-name dxhacksdev01
```

Create a Windows Nano Server VM

Check on the status of the VM

```Shell
az vm get-instance-view -n dev-win-vm01 -g dx-hacks-rg --query instanceView.statuses[1].code
```
