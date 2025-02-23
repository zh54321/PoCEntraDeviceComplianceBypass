# POCEntraDeviceComplianceBypass
A Conditional Access Policy in Entra ID which only require a compliant device can be bypassed using Intune Portal client ID and a special redirect URI.

Note that any other Conditional Access Policies and conditions you’ve configured in your tenant will still apply!

# How To
1. Execute the script.
2. Open the Browser Developer tools and authenticate normally.

3. After clicking on "Continue" you should see an error message in the Browser console:

![image](https://github.com/user-attachments/assets/831852d2-d702-4a22-a56c-692c4a8ec6ea)


4. Click on the URL in the Browser console (ms-appx-web://...) this will open the URL in a new tab.
Copy the content of the code parameter into the script window. This will get you an access and refresh token (stored in $token):

![image](https://github.com/user-attachments/assets/ebaf3109-1d84-4da3-acb2-51b8ab641266)

The refresh token can, for example, be used to obtain an access token for Azure AD Graph for example using https://github.com/zh54321/EntraTokenAid.git.

Update February 2024:
Microsoft changed the pre-consented scopes on the Azure AD Graph API (user_impersonation --> Service_PrincipalEndpoint.Read.All,User.Read).
Therefore, it is not possible anymore to run tools like ROADrecon.

# Credits
- For the write-up: [TokenSmith – Bypassing Intune Compliant Device Conditional Access by JUMPSEC](https://labs.jumpsec.com/tokensmith-bypassing-intune-compliant-device-conditional-access/)
- For discovery and sharing:
  - TEMP43487580 (@TEMP43487580)
    - Presentation: https://i.blackhat.com/EU-24/Presentations/EU-24-Chudo-Unveiling-the-Power-of-Intune-Leveraging-Intune-for-Breaking-Into-Your-Cloud-and-On-Premise.pdf
    - Pytune tool: https://github.com/secureworks/pytune
  - Dirk-jan, (@_dirkjan)
