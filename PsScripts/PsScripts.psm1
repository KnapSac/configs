function Set-PoshGitSettings {
    $GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "[HH:mm]") '
    $GitPromptSettings.DefaultPromptPrefix.ForegroundColor = 'LightBlue'
    $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
    $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
    $GitPromptSettings.DefaultPromptAbbreviateGitDirectory = $True
}

function Use-ShortGit {
    git $args
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

function Start-VisualStudio {
    param(
        [String]$Solution = "",
        [String]$Version = "2017"
    )

    if ($Version -eq "2019") {
        $VsPath = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"
    } else {
        $VsPath = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe"
    }

    if ($Solution) {
        Start-Process -FilePath $VsPath -ArgumentList $Solution -Verb RunAs
    }
    else {
        Start-Process -FilePath $VsPath -Verb RunAs
    }
}

function Start-NeoVim {
    nvim-qt $args
}

function Update-NeoVim {
    nvim +PlugInstall +qa
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