# SignFile.ps1
SignFile is a PowerShell script designed to offer a slightly less manual approach to signing PowerShell files.

his is useful as some environments require PowerShell files to be signed before they can be run. This is a configurable execution policy in PowerShell. For more information on the execution policy, see the [TechNet articles](http://technet.microsoft.com/en-us/library/ee176949.aspx#EEAA).

## Parameters
No parameters are required by this script. The script will present the user with choices to configure the signing process.
## Usage
Inside the PowerShell console enter the following:
```
&"<Path to script>"
```
For example
```
&"C:\Scripts\SignFile.ps1"
```
The script will then have you select a valid code-signing certificate, and then the path to the file to be signed.
