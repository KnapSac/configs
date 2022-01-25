New-Alias -Name cdd -Value Set-LocationToDownloads
New-Alias -Name galias -Value git-alias-prettifier
New-Alias -Name lines -Value Get-LineCount
New-Alias -Name ll -Value Get-ExaLl
New-Alias -Name mods -Value Show-Modifications
New-Alias -Name n -Value nvim.exe
New-Alias -Name touch -Value New-File
New-Alias -Name upvim -Value Update-NeoVim
New-Alias -Name vs -Value Start-VisualStudio
New-Alias -Name which -Value Get-CmdLocation
New-Alias -Name xserv -Value Start-XServer

New-Alias -Name npmhttps -Value Start-NpmWithHttps
New-Alias -Name note -Value Start-NvimWithNotes

Export-ModuleMember -Alias * -Function *
