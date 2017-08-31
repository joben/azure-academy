#change using your account tenant id
$tenantid = 

#change using your app's client id
$clientid = 

#change using your app's client secret
$clientsecret = 

#this will be important when you have to do this programmatically like via an automated script or a web app
#https://login.windows.net/72f988bf-86f1-41af-91ab-2d7cd011db47/oauth2/authorize

#remember to change your tenant id
$token = Invoke-RestMethod -uri "https://login.windows.net/$tenantid/oauth2/token" -method post -body @{"grant_type" = "client_credentials"; "resource" = "https://management.core.windows.net/"; "client_id" = $clientid; "client_secret" = $clientsecret}

#change using your account subscription id
$subscriptionid = 
$subscriptionURI = "https://management.azure.com/subscriptions/$subscriptionid/providers/microsoft.Security/securitystatuses" + '?api-version=2015-06-01-preview'

$headers = @{'authorization'="Bearer $($token.access_token)"}
$request = Invoke-RestMethod -uri $subscriptionURI -method get -contenttype "application/x-www-form-urlencoded" -headers $headers

Write-Host $request.value
