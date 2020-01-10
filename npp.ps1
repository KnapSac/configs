param([String]$file="")

if ($file)
{
    Start-Process -FilePath $npp_path -ArgumentList $file
}
else
{
    Start-Process -FilePath $npp_path
}