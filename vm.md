#Creating Virtual Machines on Azure

#How to

1. Checking for available Virtual Machine images 

Check all available Windows Server VM images
az vm image list --offer WindowsServer --all
az vm image list --offer WindowsServer --query "[?contains (sku, '2012')]"


. Create a base Windows Server 2016 VM

az vm create -n dev-win-vm01 -g dx-hacks-rg -l southeastasia \
--admin-username joben --admin-password Pass@word1 \
--image MicrosoftWindowsServer:WindowsServer:2016-Datacenter-with-Containers:2016.0.20170127 \
--size Standard_D11_v2 --storage-acount dxhackswinsvr01st  \
--vnet-name dx-hacks-vnet --subnet workstations \
--public-ip-address dxdev01-pip --public-ip-address-dns-name dxhacksdev01

