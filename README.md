
Modules
=======

Windows Path and Shims
-----
Helpers for tools that you want have in your PATH so you can run from command-line, but don't want to keep adding new folders to PATH.

This all works by creating batch files (shims) in a single folder that is added to your PATH. The shims call out to your command-line tools.


**Set-ShimPath**

Run once to initialize your shim path.

>     Set-ShimPath "C:\utility\shims" -Force

- Force - Creates the directory if it does not exist


**New-Shim**

Run for each shim you want to create.

>     New-Shim "flyway" "C:\tools\flyway-3.2.1\flyway.cmd"

This command creates a batch file named `flyway.bat` in your shim path. It will call `C:\tools\flyway-3.2.1\flyway.cmd` and pass-through the parameters.