
# Path - The URL to copy the XML file from
# Destination - either 'conemu' (the ConEmu install directory) or user appdata. Defaults to conemu.
function Install-ConEmuConfig() 
{
	param
	(
		[Parameter(Mandatory=$True,Position=0)]
		[string]$Path,
		
		[Parameter(Position=1)]
		[ValidateSet("conemu","appdata")]
		[string]$Destination
	)

	$destinationPath = if ($Destination -eq "appdata") { $env:AppData } else { "$env:ProgramFiles\ConEmu\ConEmu" } 

	(wget $Path).Content > "$destinationPath\ConEmu.xml"
}
