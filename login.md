#Login to your Azure account
az login -u <username> -p <password>

--if you have MFA enabled
1. az login
2. open a browser window to aka.ms/devicelogin
3. type the device code

#Azure accounts
1. View subscriptions associated with your user account
az account list

2. Set your default azure account
az account set --subscription $(az account list --query "[1].id" --output tsv)

