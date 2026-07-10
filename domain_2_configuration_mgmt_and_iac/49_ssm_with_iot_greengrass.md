# SSM with AWS IoT Greengrass
- Maanged IoT Greengrass Core devices using SSM
- Install SSM Agent on Greengrass Core devices (registed manage node `mi` in SSM)
- Can do this manually or deploy a Greengrass Component (prebuilt)
- You msut add permissions to the Token exchange Role (IAM Role for the IoT core device) to communicaet with Systems Manager
- Supports all SSM Capabiliteis
- Use case: easily update and maintain OS and software updates acrss a fleet of Greengrass Core devices