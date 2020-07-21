
Add-Type -AssemblyName System.Windows.Forms
function promptForDbFilePath {
    $dialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog
    $dialog.title = "Select KeepassXC database file"
    $dialog.filter = "KeepassXC database files (*.kdbx)|*.kdbx"
    $result = $dialog.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true }));

    if ($result -eq "OK") {
        return $dialog.filename;
    }

    return $null;
}

Write-Host "Select KeepassXC database file"
$dbFilePath = promptForDbFilePath
if ([string]::IsNullOrEmpty($dbFilePath)) {
    Write-Host "No KeepassXC db file selected"
    exit -1;
}

$key = Read-Host -AsSecureString "Enter password for selected database"
$keyEncrypted = $key | ConvertFrom-SecureString;


$configFilePath = "$PSScriptRoot\config.json"
@{ dbFilePath = $dbFilePath; keyEncrypted = $keyEncrypted } | ConvertTo-Json -depth 100 | Out-File $configFilePath

Write-Host Generated configuration file: $configFilePath

