if (Test-Path ".\.git" -PathType Container)
{
    git log --oneline
}
elseif (Test-Path ".\.svn" -PathType Container)
{
    TortoiseProc.exe /command:log /path:.
}
else
{
    echo "This is directory is not a Git or SVN repository"
}