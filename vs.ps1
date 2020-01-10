param([String]$sln="")

if ($sln)
{
    Start-Process -FilePath $vs_path -ArgumentList $sln
}
else
{
    Start-Process -FilePath $vs_path
}