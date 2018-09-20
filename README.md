##### Installation

1. Start PowerShell
2.  `mkdir ~\My Documents\WindowsPowerShell\Modules` (skip this step if the directory already exists or go somewhere else in your $Env:PSModulePath)
3. `cd '~\My Documents\WindowsPowerShell\Modules'`
4. `git clone git@github.com:nicholascm90/chomp.ps.git chomp`
5. Include this in your `~\My Documents\WindowsPowerShell\profile.ps1` (or create a new one if the file doesn't exist yet)

`Import-Module chomp`

##### Usage

# Easiest way is to use tab-completion to ensure that you pass a valid path to chomp

chomp './test-path' 

Chomp will move your files to a directory in your user profile, and delete them in the background, which gives you the experience of 'instant' delete.


