if (Test-Path ".\.git" -PathType Container)
{
    TortoiseGitProc.exe /command:repostatus /path:.
}
elseif (Test-Path ".\.svn" -PathType Container)
{
    TortoiseProc.exe /command:repostatus /path:.
}
else
{
    echo "This is directory is not a Git or SVN repository"
}