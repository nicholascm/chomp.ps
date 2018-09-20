function chomp([string]$path) {
    $userDirectory = $env:userprofile
    Write-Host $userDirectory
    # thanks for random string generator: https://www.undocumented-features.com/2016/09/20/powershell-random-password-generator/
    $randomString = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..8] -join ''
    $trashDirectory = $randomString  -replace '(-|#|\||"|,|/|:|\?)', ''

    Write-Host $trashDirectory
    $fullTrashPath = "$($userDirectory)\__chomp\$($trashDirectory)"
    Write-Host "the path is" 
    Write-Host $fullTrashPath
    if (!(Test-Path -Path "$($userDirectory)\__chomp")) {
        New-Item "$userDirectory\__chomp" -ItemType directory
    }
    New-Item -Path "$($fullTrashPath)" -ItemType directory
    Move-Item -Path $path -Destination $fullTrashPath
    Start-Job { 
        Remove-Item -Path $args[0] -Force -Recurse
        Write-Host "Chomped items"
    } -ArgumentList $fullTrashPath
    Write-Host "Background job chomping $path"
}