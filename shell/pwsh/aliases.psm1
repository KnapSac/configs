New-Alias -Name cdd -Value Set-LocationToDownloads
New-Alias -Name envvars -Value Show-EnvVars
New-Alias -Name galias -Value git-alias-prettifier
New-Alias -Name mods -Value Show-Modifications
New-Alias -Name n -Value nvim.exe
New-Alias -Name rmrf -Value Remove-RecurseForce
New-Alias -Name touch -Value New-File
New-Alias -Name upvim -Value Update-NeoVim
New-Alias -Name vs -Value Start-VisualStudio
New-Alias -Name xserv -Value Start-XServer

New-Alias -Name npmhttps -Value Start-NpmWithHttps

# Override default `pwd` alias to exclude header
Set-Alias -Name pwd -Value Get-ProcessWorkingDirectory

Export-ModuleMember -Alias *
