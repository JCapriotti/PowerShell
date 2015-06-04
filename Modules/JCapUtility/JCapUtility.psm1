
$script:shimPathEnvVar = "JCapShimPath"


function Set-ShimPath
{
	param(
		$path,
		[switch] $Force
	)
	
	if ((!(Test-Path $path)) -and !$Force) {
		throw (New-Object System.InvalidOperationException "Path $path not found")
	}
	elseif ((!(Test-Path $path)) -and $Force) {
		New-Item $path -Type directory
	}
	
	[Environment]::SetEnvironmentVariable($script:shimPathEnvVar, $path, "User")
	
	Add-Path $path
}

function New-Shim
{
	param(
		$name,
		$path
	)

	$shimPath = [Environment]::GetEnvironmentVariable($script:shimPathEnvVar, "User")
	$shimFile = Join-Path $shimPath "$name.bat"
	
	"@echo off
	SET DIR=%~dp0%
	cmd /c ""$path %*""
	exit /b %ERRORLEVEL%" | Out-File $shimFile -encoding ASCII
}

function Add-Path
{
	param(
		$path
	)
	
	$current = [Environment]::GetEnvironmentVariable("Path", "User")
	
	if ($current -notlike "*$path*") {
		$new = "$current;$path"
		[Environment]::SetEnvironmentVariable("Path", $new, "User")
	}
}	


Export-ModuleMember Set-ShimPath, Add-Path, New-Shim

