param([String]$sln="")

if ($sln)
{
    Start-Process -FilePath $vs_path -ArgumentList $sln -Verb RunAs
}
else
{
    Start-Process -FilePath $vs_path -Verb RunAs
}