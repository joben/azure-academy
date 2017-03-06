#Creating Virtual Machines on Azure

#How to

1. Checking for available Virtual Machine images 

Check all available Windows Server VM images

```Shell
az vm image list
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
List # of disks of the VM

```Shell
az vm disk list --vm-name dev-win-vm01 -g dx-hacks-rg 
```

Add an additional disk to the VM to store persistent data

```Shell
az vm disk attach-new --vm-name dev-win-vm01 -g dx-hacks-rg --vhd https://dxhacksfs.blob.core.windows.net/vhd/dev-win-vm01-d000.vhd --disk-size 1023
```

```Shell
az vm disk detach -g dx-hacks-rg --vm-name dev-win-vm01 --name dev-win-vm01-d000
```

Remove an attached disk from the vm

#Creating Linux VMs
1. Search for Suse Linux images

```Shell
az vm image list --all --query "[?contains(offer,'SLES')]"
```

2. See available vm sizes

```Shell
az vm list-sizes -l southeastasia -o table
```

```Shell
az vm create -n dev-sles-vm01 -g dx-hacks-rg --image SUSE:SLES:12-SP2:2016.12.14 \
        --authentication-type ssh --vnet dx-hacks-vnet --subnet-name workstations \
        --size Standard_D2_v2 --storage-account dev-sles-st1 \
        --public-ip-address dxdev02-pip --public-ip-address-dns-name dxhacksdev02         

az vm create -n dev-vm-cent01 -g dx-hacks-rg --image OpenLogic:CentOS:7.3:7.3.20161221 \
        --authentication-type ssh --vnet dx-hacks-vnet --subnet-name workstations \
        --size Standard_D11_v2 --storage-account dxhackslinux01st \
        --public-ip-address dxdev03-pip --public-ip-address-dns-name dxhacksdev03         
```
```Shell
az vm list-sizes -l southeastasia --output json --query '[?numberOfCores > `2`].{name:name, cores:numberOfCores}' --output table
```

