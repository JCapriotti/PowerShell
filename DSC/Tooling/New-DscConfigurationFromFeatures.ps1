

function New-DscConfigurationFromFeatures
{
	param 
	(
		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$true)]
		[string]$Path,

		[string]$FeatureFilter,
		
		[Switch]$Force = $false
	)

	$features = Get-WindowsFeature | Where-Object {$_.Name -like "$FeatureFilter*"}

	# Build out Configuration
	$configuration = @();
	$configuration += "configuration $Name"
	$configuration += "{"
	foreach ($feature in $features)
	{
		if ($feature.Installed) 
		{
			$featureName = $feature.Name
			$configuration += "`tWindowsFeature $featureName"
			$configuration += "`t{"
			$configuration += "`t`tName = ""$featureName"""
			$configuration += "`t`tEnsure = ""Present"""
			$configuration += "`t}"		
		}	
	}
	$configuration += "}"

	$configurationString = $configuration -join "`r`n"

	$file = New-Item $Path -Type file -Value $configurationString -Force:$Force
}