$startupDir = [Environment]::GetFolderPath("Startup")
$shortcutPath = "$startupDir\KeepassXC-autounlock.lnk"

Remove-Item $shortcutPath

