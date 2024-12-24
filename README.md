# POCEntraDeviceComplianceBypass
A Conditional Access Policy in Entra ID which only require a compliant device can be bypassed using Intune Portal client ID and a special redirect URI.

# How To
Execute the script.

Open the Browser Developer tools and authenticate normally.

After clicking on "Continue" you should see an error message in the Browser console:

![image](https://github.com/user-attachments/assets/fc76f3fd-2ff3-45c3-9702-3094886c15f5)

Click on the URL in the Browser console (ms-appx-web://...) this will open the URL in a new tab.

Copy the content of the code parameter into the script window. This will get you an access and refresh token (stored in $token):

![image](https://github.com/user-attachments/assets/ebaf3109-1d84-4da3-acb2-51b8ab641266)

The refresh token can be example used to get an access token to Azure AD Graph (using https://github.com/zh54321/EntraTokenAid.git)

![image](https://github.com/user-attachments/assets/53c23690-cde9-4505-b38a-a7f58a7e45dd)

Or to run ROADrecon
```powershell
roadtx gettoken --refresh-token $tokens.refresh_token -c 9ba1a5c7-f17a-4de9-a1f1-6178c8d51223
Requesting token for resource https://graph.windows.net
Tokens were written to .roadtools_auth
PS C:\Tools\EntraTokenAid> roadrecon gather
Starting data gathering phase 1 of 2 (collecting objects)
Starting data gathering phase 2 of 2 (collecting properties and relationships)
ROADrecon gather executed in 17.08 seconds and issued 1258 HTTP requests.
```

# Credits

This module includes a JWT parsing method that was initially adapted from the following blog post:

- For the write-up: [TokenSmith – Bypassing Intune Compliant Device Conditional Access by JUMPSEC](https://labs.jumpsec.com/tokensmith-bypassing-intune-compliant-device-conditional-access/)
- For discovery and sharing: TEMP43487580 (@TEMP43487580) & Dirk-jan, (@_dirkjan)
