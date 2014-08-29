### cWebAuthentication
Enables or disables Windows, basic, or anonymous authentication for IIS sites and applications.

* **Location**: The IIS site location
* **Type**: Anonymous, Basic, or Windows
* **Ensure**: Present or Absent
* 

#### Example


    # Turn on anonymous for root
    cWebAuthentication RootAnonymous
    {
    	Location = ""
    	Type = "Anonymous"
    	Ensure = "Present"
    }


    # Turn on Windows Auth for Contoso
    cWebAuthentication ContosoWindowsAuth
    {
    	Location = "Contoso"
    	Type = "Windows"
    	Ensure = "Present"
    }


    # Turn OFF Windows Auth for Contoso/SubApp
    cWebAuthentication ContosoWindowsAuth
    {
    	Location = "Contoso/SubApp"
    	Type = "Windows"
    	Ensure = "Absent"
    }
