# SSM with AWS IoT Greengrass
- Managed IoT Greengrass Core devices using SSM
- Install SSM Agent on Greengrass Core devices (registed manage node `mi` in SSM)
- Can do this manually or deploy a Greengrass Component (prebuilt)
- You must add permissions to the Token exchange Role (IAM Role for the IoT core device) to communicate with Systems Manager
- Supports all SSM Capabiliteis
- Use case: easily update and maintain OS and software updates acrss a fleet of Greengrass Core devices