# Create nvim symlinks
New-Item -ItemType Directory -Path "${env:LOCALAPPDATA}/nvim"
Push-Location -Path "${env:LOCALAPPDATA}/nvim"
New-Item -ItemType SymbolicLink -Name "init.vim" -Value "I:/Configs/editor/nvim/init.vim"
New-Item -ItemType SymbolicLink -Name "coc-settings.json" -Value "I:/Configs/editor/nvim/coc-settings.json"
New-Item -ItemType SymbolicLink -Name "lua" -Value "I:/Configs/editor/nvim/lua"
Pop-Location

# Install `plug`
Invoke-WebRequest https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | New-Item "${env:LOCALAPPDATA}/nvim/autoload/plug.vim" -Force

# Include git config into global config
$GitConfig = '
[include]
    path = I:\\Configs\\git\\.gitconfig'
Out-File -Path "${env:USERPROFILE}/.gitconfig" -Append -Input $GitConfig

# Create VsVim symlink
New-Item -ItemType Directory -Path "${env:USERPROFILE}/vimfiles"
Push-Location -Path "${env:USERPROFILE}/vimfiles"
New-Item -ItemType SymbolicLink -Name ".vsvimrc" -Value "I:/Configs/editor/vs/.vsvimrc"
Pop-Location
