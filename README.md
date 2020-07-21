# KPXC auto unlock [Windows only]

This project contains set of scripts that allow KeepassXC database to be auto unlocked on Windows startup.

## Security

The password for the database is encrypted with Windows Data Protection API (DPAPI) for the executing user and stored in config file.
DPAPI derives the encryption key from user's logon credentials. 
The stored password can be decrypted by any process running on the same user account. However, it *should* be protected from other users and physical access.

In general **I don't recommend using this method of unlock** unless you really need the convenience of auto unlock on login. 

## Installation

* Run `configure.ps1` to specify path to the database and password to use.
* Run `add-to-startup.ps1` to start KeepassXC and unlock the database on startup. 

## Removal 

* Run `remove-from-startup.ps1` to remove the script from startup. 
* Remove `config.json` file.



