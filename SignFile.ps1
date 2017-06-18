Clear-Host
$Close = $false;
$Certs=Get-ChildItem cert:\CurrentUser\My -codesigning -ErrorAction SilentlyContinue
if ($Certs -and $Certs.Length -gt 0)
{
    Clear-Host
    while(!$Close)
    {
        $File = Read-Host 'What is the file path? (ProTip: Shift+Right-Click the file and click "Copy as Path" and the right-click the console and select paste)'
        $File = $File.Replace('"','');
        if ([System.IO.File]::Exists($File))
        {
            Clear-Host
            while(!$Close)
            {
                Write-Host "Here are the usable certs"
                $Certs
                $Index;
                if ($Certs.Length -gt 1)
                {
                    $Index= Read-Host 'Which cert should we sign with? (Count starts at "0" from top to bottom")'
                }
                else
                {
                    $Index=0;
                }
 
                if ($Index -lt $Certs.Length -and $Index -ge 0)
                {
                    Set-AuthenticodeSignature $File $Certs[$Index]
                    $Close = $true;
                }
                else
                {
                    Write-Host ("The cert you chose is out of bounds! Minimum is 0. Maximum is "+($Certs.Length-1)) -ForegroundColor Red
                    if ($Index -ne 0)
                    {
                        Write-Host "Let's try that again..."
                    }
                    else{
                        $Close = $true;
                    }
                }
            }
        }
        else
        {
            Write-Host "File does not exist!" -ForegroundColor Red
            Write-Host "Let's try that again..."
        }
    }
}
else
{
    Write-Host "You have no certs to sign with!" -ForegroundColor Red
}
