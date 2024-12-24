                    

#Craft URL and start Browser
$Url ="https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?response_type=code&client_id=9ba1a5c7-f17a-4de9-a1f1-6178c8d51223&redirect_uri=ms-appx-web://Microsoft.AAD.BrokerPlugin/S-1-15-2-2666988183-1750391847-2906264630-3525785777-2857982319-3063633125-1907478113&state=9gaPNizkzgtisKqA&scope=https://graph.microsoft.com/.default offline_access&client_info=1"
$Url += '&claims={"access_token": {"xms_cc": {"values": ["CP1"]}}}'               
Start-Process $Url                  
                    
                    
#Wait for the Code parameter
write-host "Open Browser dev tools, authenticate and click on the URL in the error message (ms-appx-web://...)"
$codeValue = Read-Host "Enter content of CODE parameter"

#Define headers (adjust for your needs)             
$Headers = @{
    "User-Agent" = "python-requests/2.32.3"
    "X-Client-Sku" = "MSAL.Python"
    "X-Client-Ver" = "1.31.0"
    "X-Client-Os" = "win32"
}

#Define Body
$Body = @{
    grant_type   = "authorization_code"
    client_id    = "9ba1a5c7-f17a-4de9-a1f1-6178c8d51223"
    scope        = "https://graph.microsoft.com/.default offline_access"
    code         = $codeValue
    redirect_uri = "ms-appx-web://Microsoft.AAD.BrokerPlugin/S-1-15-2-2666988183-1750391847-2906264630-3525785777-2857982319-3063633125-1907478113"
    client_info  = 1
    claims       = '{"access_token": {"xms_cc": {"values": ["CP1"]}}}'
}


# Call the token endpoint to get the tokens
$tokens = Invoke-RestMethod 'https://login.microsoftonline.com/organizations/oauth2/v2.0/token' -Method POST -Body $Body -Headers $Headers
write-host 'Tokens stored in Variable $tokens'

# Display the tokens
$tokens
