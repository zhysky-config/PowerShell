$theme 		= "devblackops"
$glyphs     = . $PSScriptRoot/../Data/glyphs.ps1
$iconTheme 	= Import-PowerShellDataFile "${PSScriptRoot}/../Data/iconThemes/$theme.psd1"
$colorTheme	= Import-PowerShellDataFile "${PSScriptRoot}/../Data/colorThemes/$theme.psd1"

# Dot source private functions
(Get-ChildItem -Path ("$PSScriptRoot/../Private/*.ps1") -Recurse -ErrorAction Stop).ForEach({
    try {
        . $_.FullName
    } catch {
        throw $_
        $PSCmdlet.ThrowTerminatingError("Unable to load [$($import.FullName)]")
    }
})