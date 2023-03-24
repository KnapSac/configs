function mods {
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

function vs {
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

function upvim {
    nvim +PlugInstall +qa
}

function New-File {
    param (
        [parameter (Mandatory = $true)]
        [String]$FileName
    )

    Out-File -force -FilePath $FileName
}

function cdd {
    Set-Location "${Env:USERPROFILE}\Downloads"
}

function npmhttps {
    cmd /c "set HTTPS=true&&npm start"
}

function note {
    nvim + $Notes
}

function todo {
    nvim + $Todos
}

function lstodo {
    glow $Todos
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

function which {
    param(
        [parameter (Mandatory = $true)]
        [String]$CmdName
    )

    Get-Command $CmdName | Select -ExpandProperty Source
}

function lines {
    $Input | Measure-Object | Select -ExpandProperty Count
}

function ll {
    exa -l $args
}

function Enable-GrpcDebugging {
    $env:GRPC_VERBOSITY = "DEBUG"
    $env:GRPC_TRACE = "call_error"
}

function latest {
    $CurrentBranchName = git rev-parse --abbrev-ref HEAD
    git checkout master
    git pull
    git branch -d $CurrentBranchName
}
