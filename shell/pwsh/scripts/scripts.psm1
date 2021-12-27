function Set-PoshGitSettings {
    $GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date +[%H:%M]) '
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
    $GitRepoRootDir = git root
    if ($?) {
        TortoiseGitProc.exe /command:repostatus /path:$GitRepoRootDir
    }
}

function Start-VisualStudio {
    param(
        [String]$Solution = ""
    )

    $VsPath = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe"

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

function Set-LocationToDownloads {
    Set-Location "${Env:USERPROFILE}\Downloads"
}

function Start-XServer {
    & I:\Utils\VcXsrv\vcxsrv.exe -multiwindow -ac
}

function Start-NpmWithHttps {
    cmd /c "set HTTPS=true&&npm start"
}

function Start-NvimWithNotes {
    nvim + $Notes
}

function Get-AssemblyInfo {
    param(
        [parameter (Mandatory = $true)]
        [String]$AssemblyName
    )

    $CurrentDir = Get-Location
    $FullPath = Join-Path -Path $CurrentDir -ChildPath $AssemblyName -Resolve
    $AssemblyInfo = [Reflection.AssemblyName]::GetAssemblyName($FullPath)
    Write-Host $AssemblyInfo
}
