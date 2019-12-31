dir . -filter "*.cs" -Recurse -Name | foreach{(GC $_).Count} | measure-object -sum

[string[]]$Paths = dir .
[string[]]$Excludes = @('*Properties*', '*obj*')

$files = Get-ChildItem $Paths -Directory -Recurse -Exclude $Excludes | %{ 
    $allowed = $true
    foreach ($exclude in $Excludes) { 
        if ((Split-Path $_.FullName -Parent) -ilike $exclude) { 
            $allowed = $false
            break
        }
    }
    if ($allowed) {
        echo $_.FullName
    }
}