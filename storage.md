#Azure Storage

Use naming convention

dxhackwinsvr01st

1. Create a Storage Account

Storage account will be for creating a data disk that will be attached to a VM

```Shell
az storage account create -g dx-hacks-rg -n dxhackswinsvr01st -l southeastasia 
--sku Standard_LRS --tags project:dxhacks 
```

File Shares

Windows

Persisting file share mount on windows vm
https://docs.microsoft.com/en-us/azure/storage/storage-dotnet-how-to-use-files

```shell
cmdkey /add:<storage-account-name>.file.core.windows.net /user:AZURE\<storage-account-name> /pass:<storage-account-key>
```

Mounting Fileshares in an Azure Windows VM
net use <drive-letter>: \\<storage-account-name>.file.core.windows.net\<share-name>

example :
net use z: \\\\samples.file.core.windows.net\logs

Linux




