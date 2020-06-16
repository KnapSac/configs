function Set-PoshGitSettings {
    $GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "[HH:mm]") '
    $GitPromptSettings.DefaultPromptPrefix.ForegroundColor = 'DarkGray'
    $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
    $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
    $GitPromptSettings.DefaultPromptAbbreviateGitDirectory = $True
}

function Show-Log {
    if (Test-Path ".\.git" -PathType Container) {
        git log --all --graph --decorate --oneline
    }
    elseif (Test-Path ".\.svn" -PathType Container) {
        TortoiseProc.exe /command:log /path:.
    }
    else {
        Write-Output "This directory is not a Git or SVN repository"
    }
}

function Update-Config {
    git --git-dir 'I:\Configs\' --work-tree ((Get-Location).Path + '\') $args
}

function Show-Modifications {
    if (Test-Path ".\.git" -PathType Container) {
        TortoiseGitProc.exe /command:repostatus /path:.
    }
    elseif (Test-Path ".\.svn" -PathType Container) {
        TortoiseProc.exe /command:repostatus /path:.
    }
    else {
        Write-Output "This directory is not a Git or SVN repository"
    }
}

function Show-GitStatus {
    if (Test-Path ".\.git" -PathType Container) {
        git status
    }
    else {
        Write-Output "This directory is not a Git repository"
    }
}

function New-GitCommit {
    git commit $args
}

function New-GitPush {
    git push $args
}

function Start-VisualStudio {
    param([String]$sln = "")

    if ($sln) {
        Start-Process -FilePath $vs_path -ArgumentList $sln -Verb RunAs
    }
    else {
        Start-Process -FilePath $vs_path -Verb RunAs
    }
}

function Start-NeoVim {
    nvim-qt $args
}

function Update-NeoVim {
    nvim +PlugInstall +qa
}

function Show-DirectoryCmd { 
    cmd /r dir $args 
}

function New-File { 
    param (
        [parameter (Mandatory = $true)]
        [String]$FileName
    )
    
    Out-File -force -FilePath $FileName
}
  

#TODO CV: Refactor profiles to be project specific
function Open-WorkEnv {
    Set-Location $work_dir
    vs $work_sln_path
    Start-Process $browser$work_url
    Start-Process -FilePath $console_path -Verb RunAs
    Start-Process -FilePath $baretail_path
    mods
    log
}

function Open-UniEnv {
    Set-Location $uni_dir
    Start-VisualStudio $uni_sln_path
    #code .
    Start-Process $browser$github_url
    mods
}