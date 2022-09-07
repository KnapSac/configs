function Show-Log {
    if (Test-Path ".\.svn" -PathType Container) {
        TortoiseProc.exe /command:log /path:.
    } else {
        Write-Output "This directory is not a SVN repository"
    }
}

function Show-Modifications {
    param (
        [parameter (Mandatory = $False)]
        [String]$Path = ""
    )
    if ($Path -eq "") {
        $GitRepoRootDir = git root
        if ($?) {
            # Include all staged files, this ensures we see changed all files in the repo.
            Set-ItemProperty -Path HKCU:\SOFTWARE\TortoiseGit\TortoiseProc -Name ChangedFilesIncludeStaged -Value $True
            TortoiseGitProc.exe /command:repostatus /path:$GitRepoRootDir
        }
    } else {
        # Don't include all staged files in the repo, this ensures we only see the changes from the
        # current folder and below.
        Set-ItemProperty -Path HKCU:\SOFTWARE\TortoiseGit\TortoiseProc -Name ChangedFilesIncludeStaged -Value $False

        TortoiseGitProc.exe /command:repostatus /path:$Path
    }
}

function Start-VisualStudio {
    param(
        [String]$Solution = ""
    )

    $VsPath = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"

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

function Get-CmdLocation {
    param(
        [parameter (Mandatory = $true)]
        [String]$CmdName
    )

    Get-Command $CmdName | Select -ExpandProperty Source
}

function Get-LineCount {
    $Input | Measure-Object | Select -ExpandProperty Count
}

function Get-ExaLl {
    exa -l $args
}

function Enable-GrpcDebugging {
    $env:GRPC_VERBOSITY = "DEBUG"
    $env:GRPC_TRACE = "call_error"
}
