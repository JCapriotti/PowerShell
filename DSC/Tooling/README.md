## New-DscConfigurationFromFeatures
Creates a new DSC configuration from existing Windows features installed on a server.

Uses `Get-WindowsFeature` in the ServerManager module.

### Syntax

    New-DscConfigurationFromFeatures -Name <String> -Path <String> [-FeatureFilter <String>] [-Force]
    
### Examples
Create a configuration force existing file to be overwritten:

    New-DscConfigurationFromFeatures -Name BasicServer -Path BasicServer.ps1 -Force

Create a configuration named BasicServer using all features installed on the server:

    New-DscConfigurationFromFeatures -Name BasicServer -Path BasicServer.ps1 


    # Output in BasicServer.ps1:
    configuration BasicServer
    {
    	WindowsFeature PowerShell-ISE
    	{
    		Name = "PowerShell-ISE"
    		Ensure = "Present"
    	}
    	WindowsFeature RSAT
    	{
    		Name = "RSAT"
    		Ensure = "Present"
    	}
    	WindowsFeature MSMQ
    	{
    		Name = "MSMQ"
    		Ensure = "Present"
    	}
    	# ... Etc ...
    }
    
Create a configuration named WebServer using only features installed on the server whose names start with "Web-":

    New-DscConfigurationFromFeatures -Name WebServer -Path WebServer.ps1 -FeatureFilter "Web-"
    
    
    # Output in WebServer.ps1:
    configuration WebServer
    {
    	WindowsFeature Web-Server
    	{
    		Name = "Web-Server"
    		Ensure = "Present"
    	}
    	WindowsFeature Web-WebServer
    	{
    		Name = "Web-WebServer"
    		Ensure = "Present"
    	}
    	WindowsFeature Web-Common-Http
    	{
    		Name = "Web-Common-Http"
    		Ensure = "Present"
    	}
    	# ... Etc ...
    }
