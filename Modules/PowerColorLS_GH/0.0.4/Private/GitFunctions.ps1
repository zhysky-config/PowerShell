function Get-GitInfo {
    param(
        [Parameter(Mandatory = $true)]
        [array]$filesAndFolders
    )

    $directoryName = Get-DirectoryName -filesAndFolders $filesAndFolders

    # determine if we should handle this as git directory
    $isGitDirectory = Get-ShowAsGitDirectory -directory $directoryName

    $lineCharsCounterIncrease = 0
    if($isGitDirectory){
        $gitStatusItems = Get-GitStatusItemList -directory $directoryName
        $lineCharsCounterIncrease = 2
    }

    return @{
        isGitDirectory = $isGitDirectory
        gitStatusItems = $gitStatusItems
        lineCharsCounterIncrease = $lineCharsCounterIncrease
    }
}


function Get-IsGitDirectory {
    param(
        [Parameter(Mandatory = $true)]
        [string]$directory
    )

    if ((Test-Path "${directory}/.git") -eq $TRUE) {
        return $TRUE
    }

    # Test within parent dirs
    $checkIn = (Get-Item ${directory}).parent
    while ($null -ne $checkIn) {
        $pathToTest = $checkIn.FullName + '/.git'
        if ((Test-Path $pathToTest) -eq $TRUE) {
            return $TRUE
        } else {
            $checkIn = $checkIn.parent
        }
    }

    return $FALSE
}

function Get-ShowAsGitDirectory{
    param(
        [Parameter(Mandatory = $true)]
        [string]$directory
    )

    # check if git directory
    $isGitDirectory = Get-IsGitDirectory -directory $directory

    # check if git is installed
    $gitIsInstalled = Get-CommandExist -command "git"

    if(-not $gitIsInstalled){
        $isGitDirectory = $false
    }

    return $isGitDirectory
}

function Get-GitStatusItemList{
    param(
        [Parameter(Mandatory = $true)]
        [string]$directory
    )

    # get the current directory
    $currentPath = (Get-Location).Path

    Set-Location -Path $directory
    $gitStatus = git status --porcelain=v1
    $gitRoot = git rev-parse --show-toplevel
    Set-Location -Path $currentPath

    $gitStatusItems = @()
    foreach($gitStatusItem in $gitStatus){
        $gs = $gitStatusItem.Trim() -Split ("\s+")
        if($gs[0] -match "R"){
            # rename 
            # R  src/Private/Splat.ps1 -> PowerColorLS_GH/Private/Splat.ps1
            $l = -join($gitRoot, "/", $gs[3])
        }
        else {
            $l = -join($gitRoot, "/", $gs[1]) 
        }
        $gitStatusItems += @{
            # only pick first charactor
            status = $gs[0][0]
            path = $l
        }
    }
    return $gitStatusItems
}

function Get-GitColorAndIcon{
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$gitInfo,

        [Parameter(Mandatory = $true)]
        $fileSystemInfo,

        [Parameter(Mandatory = $true)]
        [hashtable]$glyphs,

        [Parameter(Mandatory = $true)]
        [bool]$hideIcons
    )

    if(-not $gitInfo.isGitDirectory){
        return ""
    }

    if($hideIcons){
        $gitGlyph = "√";
    }else{
        $gitGlyph = $glyphs["nf-fa-check"]
    }

    $gitColor = (ConvertFrom-RGBColor -RGB ("00FF00"))
    $updateGitStatus = $false
    foreach($gitStatusItem in $gitInfo.gitStatusItems){
        $is_folder = (Test-Path -Path $fileSystemInfo.FullName -PathType Container)
        $currentItemForGitCompare = $fileSystemInfo.FullName -Replace "\\", "/"
        if($currentItemForGitCompare -eq $gitStatusItem.path){
            $updateGitStatus = $true
        }
        elseif($is_folder `
            -and ($gitStatusItem.path.StartsWith($currentItemForGitCompare, 'CurrentCultureIgnoreCase'))){
            $updateGitStatus = $true
        }

        if($updateGitStatus){
            switch($gitStatusItem.status){
                "?" {
                    if(-not $hideIcons){
                        $gitGlyph = $glyphs["nf-fa-question"]
                    }
                    $gitColor = (ConvertFrom-RGBColor -RGB ("FF0000"))
                }
                default{
                    # folder show as M
                    if($is_folder){
                        $gitStatusItem.status = "M";
                    }
                    $gitGlyph = $gitStatusItem.status
                    $gitColor = (ConvertFrom-RGBColor -RGB ("FFFF00"))
                }
            }
            break
        }
    }
    $gitColorAndIcon = "${gitColor}${gitGlyph} "
    return $gitColorAndIcon
}