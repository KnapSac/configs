New-Alias -Name cdd -Value Set-LocationToDownloads
New-Alias -Name galias -Value git-alias-prettifier
New-Alias -Name mods -Value Show-Modifications
New-Alias -Name n -Value nvim.exe
New-Alias -Name touch -Value New-File
New-Alias -Name upvim -Value Update-NeoVim
New-Alias -Name vs -Value Start-VisualStudio
New-Alias -Name which -Value Get-CmdLocation
New-Alias -Name xserv -Value Start-XServer

New-Alias -Name npmhttps -Value Start-NpmWithHttps
New-Alias -Name note -Value Start-NvimWithNotes

### coreutils aliases ###
Set-Alias -Name base32 -Value Get-base32 -Option AllScope
Set-Alias -Name base64 -Value Get-base64 -Option AllScope
Set-Alias -Name basename -Value Get-basename -Option AllScope
Set-Alias -Name cat -Value Get-cat -Option AllScope
Set-Alias -Name cksum -Value Get-cksum -Option AllScope
Set-Alias -Name comm -Value Get-comm -Option AllScope
Set-Alias -Name cp -Value Get-cp -Option AllScope
Set-Alias -Name csplit -Value Get-csplit -Option AllScope
Set-Alias -Name cut -Value Get-cut -Option AllScope
Set-Alias -Name date -Value Get-date -Option AllScope
Set-Alias -Name df -Value Get-df -Option AllScope
Set-Alias -Name dircolors -Value Get-dircolors -Option AllScope
Set-Alias -Name dirname -Value Get-dirname -Option AllScope
Set-Alias -Name du -Value Get-du -Option AllScope
Set-Alias -Name echo -Value Get-echo -Option AllScope
Set-Alias -Name env -Value Get-env -Option AllScope
Set-Alias -Name expand -Value Get-expand -Option AllScope
Set-Alias -Name expr -Value Get-expr -Option AllScope
Set-Alias -Name factor -Value Get-factor -Option AllScope
Set-Alias -Name false -Value Get-false -Option AllScope
Set-Alias -Name fmt -Value Get-fmt -Option AllScope
Set-Alias -Name fold -Value Get-fold -Option AllScope
Set-Alias -Name hashsum -Value Get-hashsum -Option AllScope
Set-Alias -Name head -Value Get-head -Option AllScope
Set-Alias -Name join -Value Get-join -Option AllScope
Set-Alias -Name link -Value Get-link -Option AllScope
Set-Alias -Name ln -Value Get-ln -Option AllScope
Set-Alias -Name ls -Value Get-ls -Option AllScope
Set-Alias -Name md5sum -Value Get-md5sum -Option AllScope
Set-Alias -Name mkdir -Value Get-mkdir -Option AllScope
Set-Alias -Name mktemp -Value Get-mktemp -Option AllScope
Set-Alias -Name more -Value Get-more -Option AllScope
Set-Alias -Name mv -Value Get-mv -Option AllScope
Set-Alias -Name nl -Value Get-nl -Option AllScope
Set-Alias -Name numfmt -Value Get-numfmt -Option AllScope
Set-Alias -Name od -Value Get-od -Option AllScope
Set-Alias -Name paste -Value Get-paste -Option AllScope
Set-Alias -Name pr -Value Get-pr -Option AllScope
Set-Alias -Name printenv -Value Get-printenv -Option AllScope
Set-Alias -Name printf -Value Get-printf -Option AllScope
Set-Alias -Name ptx -Value Get-ptx -Option AllScope
Set-Alias -Name pwd -Value Get-pwd -Option AllScope
Set-Alias -Name readlink -Value Get-readlink -Option AllScope
Set-Alias -Name realpath -Value Get-realpath -Option AllScope
Set-Alias -Name relpath -Value Get-relpath -Option AllScope
Set-Alias -Name rm -Value Get-rm -Option AllScope
Set-Alias -Name rmdir -Value Get-rmdir -Option AllScope
Set-Alias -Name seq -Value Get-seq -Option AllScope
Set-Alias -Name sha1sum -Value Get-sha1sum -Option AllScope
Set-Alias -Name sha224sum -Value Get-sha224sum -Option AllScope
Set-Alias -Name sha256sum -Value Get-sha256sum -Option AllScope
Set-Alias -Name sha3_224sum -Value Get-sha3-224sum -Option AllScope
Set-Alias -Name sha3_256sum -Value Get-sha3-256sum -Option AllScope
Set-Alias -Name sha3_384sum -Value Get-sha3-384sum -Option AllScope
Set-Alias -Name sha3_512sum -Value Get-sha3-512sum -Option AllScope
Set-Alias -Name sha384sum -Value Get-sha384sum -Option AllScope
Set-Alias -Name sha3sum -Value Get-sha3sum -Option AllScope
Set-Alias -Name sha512sum -Value Get-sha512sum -Option AllScope
Set-Alias -Name shake128sum -Value Get-shake128sum -Option AllScope
Set-Alias -Name shake256sum -Value Get-shake256sum -Option AllScope
Set-Alias -Name shred -Value Get-shred -Option AllScope
Set-Alias -Name shuf -Value Get-shuf -Option AllScope
Set-Alias -Name sleep -Value Get-sleep -Option AllScope
Set-Alias -Name sort -Value Get-sort -Option AllScope
Set-Alias -Name split -Value Get-split -Option AllScope
Set-Alias -Name sum -Value Get-sum -Option AllScope
Set-Alias -Name tac -Value Get-tac -Option AllScope
Set-Alias -Name tail -Value Get-tail -Option AllScope
Set-Alias -Name tee -Value Get-tee -Option AllScope
Set-Alias -Name test -Value Get-test -Option AllScope
Set-Alias -Name tr -Value Get-tr -Option AllScope
Set-Alias -Name true -Value Get-true -Option AllScope
Set-Alias -Name truncate -Value Get-truncate -Option AllScope
Set-Alias -Name tsort -Value Get-tsort -Option AllScope
Set-Alias -Name unexpand -Value Get-unexpand -Option AllScope
Set-Alias -Name uniq -Value Get-uniq -Option AllScope
Set-Alias -Name wc -Value Get-wc -Option AllScope
Set-Alias -Name yes -Value Get-yes -Option AllScope

function Get-base32 { coreutils base32 $args }
function Get-base64 { coreutils base64 $args }
function Get-basename { coreutils basename $args }
function Get-cat { coreutils cat $args }
function Get-cksum { coreutils cksum $args }
function Get-comm { coreutils comm $args }
function Get-cp { coreutils cp $args }
function Get-csplit { coreutils csplit $args }
function Get-cut { coreutils cut $args }
function Get-date { coreutils date $args }
function Get-df { coreutils df $args }
function Get-dircolors { coreutils dircolors $args }
function Get-dirname { coreutils dirname $args }
function Get-du { coreutils du $args }
function Get-echo { coreutils echo $args }
function Get-env { coreutils env $args }
function Get-expand { coreutils expand $args }
function Get-expr { coreutils expr $args }
function Get-factor { coreutils factor $args }
function Get-false { coreutils false $args }
function Get-fmt { coreutils fmt $args }
function Get-fold { coreutils fold $args }
function Get-hashsum { coreutils hashsum $args }
function Get-head { coreutils head $args }
function Get-join { coreutils join $args }
function Get-link { coreutils link $args }
function Get-ln { coreutils ln $args }
function Get-ls { coreutils ls $args }
function Get-md5sum { coreutils md5sum $args }
function Get-mkdir { coreutils mkdir $args }
function Get-mktemp { coreutils mktemp $args }
function Get-more { coreutils more $args }
function Get-mv { coreutils mv $args }
function Get-nl { coreutils nl $args }
function Get-numfmt { coreutils numfmt $args }
function Get-od { coreutils od $args }
function Get-paste { coreutils paste $args }
function Get-pr { coreutils pr $args }
function Get-printenv { coreutils printenv $args }
function Get-printf { coreutils printf $args }
function Get-ptx { coreutils ptx $args }
function Get-pwd { coreutils pwd $args }
function Get-readlink { coreutils readlink $args }
function Get-realpath { coreutils realpath $args }
function Get-relpath { coreutils relpath $args }
function Get-rm { coreutils rm $args }
function Get-rmdir { coreutils rmdir $args }
function Get-seq { coreutils seq $args }
function Get-sha1sum { coreutils sha1sum $args }
function Get-sha224sum { coreutils sha224sum $args }
function Get-sha256sum { coreutils sha256sum $args }
function Get-sha3_224sum { coreutils sha3-224sum $args }
function Get-sha3_256sum { coreutils sha3-256sum $args }
function Get-sha3_384sum { coreutils sha3-384sum $args }
function Get-sha3_512sum { coreutils sha3-512sum $args }
function Get-sha384sum { coreutils sha384sum $args }
function Get-sha3sum { coreutils sha3sum $args }
function Get-sha512sum { coreutils sha512sum $args }
function Get-shake128sum { coreutils shake128sum $args }
function Get-shake256sum { coreutils shake256sum $args }
function Get-shred { coreutils shred $args }
function Get-shuf { coreutils shuf $args }
function Get-sleep { coreutils sleep $args }
function Get-sort { coreutils sort $args }
function Get-split { coreutils split $args }
function Get-sum { coreutils sum $args }
function Get-tac { coreutils tac $args }
function Get-tail { coreutils tail $args }
function Get-tee { coreutils tee $args }
function Get-test { coreutils test $args }
function Get-tr { coreutils tr $args }
function Get-true { coreutils true $args }
function Get-truncate { coreutils truncate $args }
function Get-tsort { coreutils tsort $args }
function Get-unexpand { coreutils unexpand $args }
function Get-uniq { coreutils uniq $args }
function Get-wc { coreutils wc $args }
function Get-yes { coreutils yes $args }

### coreutils aliases ###

Export-ModuleMember -Alias * -Function *
