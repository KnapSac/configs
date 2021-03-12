function Set-PoshGitSettings {
    $GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "[HH:mm]") '
    $GitPromptSettings.DefaultPromptPrefix.ForegroundColor = 'LightBlue'
    $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
    $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
    $GitPromptSettings.DefaultPromptAbbreviateGitDirectory = $True
}

function Show-Log {
    if (Test-Path ".\.svn" -PathType Container) {
        TortoiseProc.exe /command:log /path:.
    } else {
        Write-Output "This directory is not a SVN repository"
    }
}

function Show-Modifications {
    if (Test-Path ".\.git" -PathType Container) {
        TortoiseGitProc.exe /command:repostatus /path:.
    } elseif (Test-Path ".\.svn" -PathType Container) {
        TortoiseProc.exe /command:repostatus /path:.
    } else {
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

function Remove-RecurseForce {
    Remove-Item -Recurse -Force $args
}

function Set-LocationToDownloads {
    Set-Location "${Env:USERPROFILE}\Downloads"
}

function Start-XServer {
    & I:\Utils\VcXsrv\vcxsrv.exe -multiwindow -ac
}
