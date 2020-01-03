param([Parameter(Position=0,mandatory=$true)][String]$A="")

$path = (Get-ChildItem alias:$A).Name + ".ps1"
cat $ps_scripts_dir\$path