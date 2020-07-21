$startupDir = [Environment]::GetFolderPath("Startup")

$target =  "$PSScriptRoot\start.cmd"
$shortcutPath = "$startupDir\KeepassXC-autounlock.lnk"
$shell = New-Object -ComObject WScript.Shell

$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $target
$shortcut.Save()

