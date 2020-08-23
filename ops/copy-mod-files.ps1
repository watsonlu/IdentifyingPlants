
$modTag = "affs"


$out = "C:\Users\Luke\Documents\Code\IdentifyingPlants"

$extensionsAndPaths = @{
    ".psc" = "Source\Scripts";
    ".pex" = "Scripts";
    ".esp" = ""
}

$modItems = @()

foreach ($item in $extensionsAndPaths.Keys) {
    $modItems += (get-childitem -recurse -filter "$($modTag)*$($item)").FullName
}

$modItems

foreach ($item in $modItems) {
    $extension = [System.IO.Path]::GetExtension($item)
    $fileName = Split-Path $item -Leaf
    $targetPath = Join-Path $out "$($extensionsAndPaths[$extension])\$($fileName)"
    Write-Output "Copying $($item) to $($targetPath)"
    New-Item $targetPath -Force
    Copy-Item $item $targetPath -Force
}