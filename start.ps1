$keepassxcExec = "C:\Program Files\KeePassXC\KeePassXC.exe"
$configFilePath = "$PSScriptRoot\config.json"

if (-not [System.IO.File]::Exists($configFilePath)) {
    Write-Host "No configuration file exists. Run .\configure.ps1"
    exit -1;
}

$config = Get-Content $configFilePath | ConvertFrom-Json

if ([string]::IsNullOrEmpty($config.dbFilePath) -or [string]::IsNullOrEmpty($config.passwordEncrypted)) {
    Write-Host "Empty configuration. Run .\configure.ps1"
    exit -2;
}

$passwordSecure = $config.passwordEncrypted | ConvertTo-SecureString
$password = [System.Net.NetworkCredential]::new("", $passwordSecure).Password

$password | & $keepassxcExec --pw-stdin $config.dbFilePath 