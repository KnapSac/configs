cd $work_dir
vs $work_sln_path
start $browser$work_url
Start-Process -FilePath $console_path -Verb RunAs
Start-Process -FilePath $baretail_path
mods
log