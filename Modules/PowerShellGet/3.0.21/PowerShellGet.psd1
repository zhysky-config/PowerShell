# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

@{
    RootModule        = './net472/PowerShellGet.dll'
    ModuleVersion     = '3.0.21'
    GUID              = '1d73a601-4a6c-43c5-ba3f-619b18bbb404'
    Author            = 'Microsoft Corporation'
    CompanyName       = 'Microsoft Corporation'
    Copyright         = '(c) Microsoft Corporation. All rights reserved.'
    Description       = 'PowerShell module with commands for discovering, installing, updating and publishing the PowerShell artifacts like Modules, Scripts, and DSC Resources.'
    PowerShellVersion = '5.1'
    DotNetFrameworkVersion = '2.0'
    CLRVersion = '4.0.0'
    FormatsToProcess  = 'PSGet.Format.ps1xml'
    CmdletsToExport = @(
        'Find-PSResource',
        'Get-InstalledPSResource',
        'Get-PSResourceRepository',
        'Get-PSScriptFileInfo',
        'Install-PSResource',
        'Register-PSResourceRepository',
        'Save-PSResource',
        'Set-PSResourceRepository',
        'New-PSScriptFile',
        'Test-PSScriptFile',
        'Update-PSScriptFileInfo',
        'Publish-PSResource',
        'Uninstall-PSResource',
        'Unregister-PSResourceRepository',
        'Update-ModuleManifest',
        'Update-PSResource')

    VariablesToExport = 'PSGetPath'
    AliasesToExport = @('inmo', 'fimo', 'upmo', 'pumo')
    PrivateData = @{
        PSData = @{
            Prerelease = 'beta21'
            Tags = @('PackageManagement',
                'PSEdition_Desktop',
                'PSEdition_Core',
                'Linux',
                'Mac',
                'Windows')
            ProjectUri = 'https://go.microsoft.com/fwlink/?LinkId=828955'
            LicenseUri = 'https://go.microsoft.com/fwlink/?LinkId=829061'
            ReleaseNotes = @'
## 3.0.21-beta21

### New Features
- Move off of NuGet client APIs for local repositories (#1065)

### Bug Fixes
- Update properties on PSResourceInfo object (#1077)
- Rename PSScriptFileInfo and Get-PSResource cmdlets (#1071)
- fix ValueFromPipelineByPropertyName on Save, Install (#1070)
- add Help message for mandatory params across cmdlets (#1068)
- fix version range bug for Update-PSResource (#1067)
- Fix attribute bugfixes for Find and Install params (#1066)
- Correct Unexpected spelling of Unexpected (#1059)
- Resolve bug with Find-PSResource -Type Module not returning modules (#1050)
- Inject credentials to ISettings to pass them into PushRunner (#993)

## 3.0.20-beta20

- Move off of NuGet client APIs and use direct REST API calls for remote repositories (#1023)

### Bug Fixes
- Updates to dependency installation (#1010) (#996) (#907)
- Update to retrieving all packages installed on machine (#999)
- PSResourceInfo version correctly displays 2 or 3 digit version numbers (#697)
- Using `Find-PSresource` with `-CommandName` or `-DSCResourceName` parameters returns an object with a properly expanded ParentResource member (#754)
- `Find-PSResource` no longer returns duplicate results (#755)
- `Find-PSResource` lists repository 'PSGalleryScripts' which does not exist for `Get-PSResourceRepository` (#1028)

## 3.0.19-beta19

### New Features
- Add `-SkipModuleManifestValidate` parameter to `Publish-PSResource` (#904)

### Bug Fixes
- Add new parameter sets for `-IncludeXml` and `-AsNupkg` parameters in `Install-PSResource` (#910)
- Change warning to error in `Update-PSResource` when no module is already installed (#909)
- Fix `-NoClobber` bug throwing error in `Install-PSResource` (#908)
- Remove warning when installing dependencies (#907)
- Remove Proxy parameters from `Register-PSResourceRepository` (#906)
- Remove -PassThru parameter from `Update-ModuleManifest` (#900)

## 3.0.18-beta18

### New Features
- Add Get-PSScriptFileInfo cmdlet (#839)
- Allow CredentialInfo parameter to accept a hashtable  (#836)

### Bug Fixes
- Publish-PSResource now preserves folder and file structure (#882)
- Fix verbose message for untrusted repos gaining trust (#841)
- Fix for Update-PSResource attempting to reinstall latest preview version (#834)
- Add SupportsWildcards() attribute to parameters accepting wildcards (#833)
- Perform Repository trust check when installing a package (#831)
- Fix casing of `PSResource` in `Install-PSResource` (#820)
- Update .nuspec 'license' property to 'licenseUrl' (#850)

## 3.0.17-beta17

### New Features
- Add -TemporaryPath parameter to Install-PSResource, Save-PSResource, and Update-PSResource (#763)
- Add String and SecureString as credential types in PSCredentialInfo (#764)
- Add a warning for when the script installation path is not in Path variable (#750)
- Expand acceptable paths for Publish-PSResource (Module root directory, module manifest file, script file)(#704)
- Add -Force parameter to Register-PSResourceRepository cmdlet, to override an existing repository (#717)

### Bug Fixes
- Change casing of -IncludeXML to -IncludeXml (#739)
- Update priority range for PSResourceRepository to 0-100 (#741)
- Editorial pass on cmdlet reference (#743)
- Fix issue when PSScriptInfo has no empty lines (#744)
- Make ConfirmImpact low for Register-PSResourceRepository and Save-PSResource (#745)
- Fix -PassThru for Set-PSResourceRepository cmdlet to return all properties (#748)
- Rename -FilePath parameter to -Path for PSScriptFileInfo cmdlets (#765)
- Fix RequiredModules description and add Find example to docs (#769)
- Remove unneeded inheritance in InstallHelper.cs (#773)
- Make -Path a required parameter for Save-PSResource cmdlet (#780)
- Improve script validation for publishing and installing (#781)

## 3.0.16-beta16

### Bug Fixes
- Update NuGet dependency packages for security vulnerabilities (#733)

## 3.0.15-beta15

### New Features
- Implementation of New-ScriptFileInfo, Update-ScriptFileInfo, and Test-ScriptFileInfo cmdlets (#708)
- Implementation of Update-ModuleManifest cmdlet (#677)
- Implentation of Authenticode validation via -AuthenticodeCheck for Install-PSResource (#632)

### Bug Fixes
- Bug fix for installing modules with manifests that contain dynamic script blocks (#681)

## 3.0.14-beta14

### Bug Fixes
- Bug fix for repository store (#661)

## 3.0.13-beta

### New Features
- Implementation of -RequiredResourceFile and -RequiredResource parameters for Install-PSResource (#610, #592)
- Scope parameters for Get-PSResource and Uninstall-PSResource (#639)
- Support for credential persistence (#480 Thanks @cansuerdogan!)

### Bug Fixes
- Bug fix for publishing scripts (#642)
- Bug fix for publishing modules with 'RequiredModules' specified in the module manifest (#640)

### Changes
- 'SupportsWildcard' attribute added to Find-PSResource, Get-PSResource, Get-PSResourceRepository, Uninstall-PSResource, and Update-PSResource (#658)
- Updated help documentation (#651)
- -Repositories parameter changed to singular -Repository in Register-PSResource and Set-PSResource (#645)
- Better prerelease support for Uninstall-PSResource (#593)
- Rename PSResourceInfo's PrereleaseLabel property to match Prerelease column displayed (#591)
- Renaming of parameters -Url to -Uri (#551 Thanks @fsackur!)

See change log (CHANGELOG.md) at https://github.com/PowerShell/PowerShellGet
'@
        }
    }

    HelpInfoUri       = 'https://aka.ms/powershellget-3.x'
}

# SIG # Begin signature block
# MIInogYJKoZIhvcNAQcCoIInkzCCJ48CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA9KnDDhCrU76+j
# k2rje9hui2y+Za7lPqWElyAzbZgdo6CCDYUwggYDMIID66ADAgECAhMzAAADTU6R
# phoosHiPAAAAAANNMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMwMzE2MTg0MzI4WhcNMjQwMzE0MTg0MzI4WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDUKPcKGVa6cboGQU03ONbUKyl4WpH6Q2Xo9cP3RhXTOa6C6THltd2RfnjlUQG+
# Mwoy93iGmGKEMF/jyO2XdiwMP427j90C/PMY/d5vY31sx+udtbif7GCJ7jJ1vLzd
# j28zV4r0FGG6yEv+tUNelTIsFmmSb0FUiJtU4r5sfCThvg8dI/F9Hh6xMZoVti+k
# bVla+hlG8bf4s00VTw4uAZhjGTFCYFRytKJ3/mteg2qnwvHDOgV7QSdV5dWdd0+x
# zcuG0qgd3oCCAjH8ZmjmowkHUe4dUmbcZfXsgWlOfc6DG7JS+DeJak1DvabamYqH
# g1AUeZ0+skpkwrKwXTFwBRltAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUId2Img2Sp05U6XI04jli2KohL+8w
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzUwMDUxNzAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# ACMET8WuzLrDwexuTUZe9v2xrW8WGUPRQVmyJ1b/BzKYBZ5aU4Qvh5LzZe9jOExD
# YUlKb/Y73lqIIfUcEO/6W3b+7t1P9m9M1xPrZv5cfnSCguooPDq4rQe/iCdNDwHT
# 6XYW6yetxTJMOo4tUDbSS0YiZr7Mab2wkjgNFa0jRFheS9daTS1oJ/z5bNlGinxq
# 2v8azSP/GcH/t8eTrHQfcax3WbPELoGHIbryrSUaOCphsnCNUqUN5FbEMlat5MuY
# 94rGMJnq1IEd6S8ngK6C8E9SWpGEO3NDa0NlAViorpGfI0NYIbdynyOB846aWAjN
# fgThIcdzdWFvAl/6ktWXLETn8u/lYQyWGmul3yz+w06puIPD9p4KPiWBkCesKDHv
# XLrT3BbLZ8dKqSOV8DtzLFAfc9qAsNiG8EoathluJBsbyFbpebadKlErFidAX8KE
# usk8htHqiSkNxydamL/tKfx3V/vDAoQE59ysv4r3pE+zdyfMairvkFNNw7cPn1kH
# Gcww9dFSY2QwAxhMzmoM0G+M+YvBnBu5wjfxNrMRilRbxM6Cj9hKFh0YTwba6M7z
# ntHHpX3d+nabjFm/TnMRROOgIXJzYbzKKaO2g1kWeyG2QtvIR147zlrbQD4X10Ab
# rRg9CpwW7xYxywezj+iNAc+QmFzR94dzJkEPUSCJPsTFMIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGXMwghlvAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAANNTpGmGiiweI8AAAAA
# A00wDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDep
# h1jndH5T7La+EdGPQ9KXlALfAq0eYpZvv3cV2FDwMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAD/SMzgB8J6gjLaexpgcnTYrjpITPnB0XdVfa
# HsO/9K+emeknkRvqQZTFh2C+hEsisSvJXIdR15tLY35YHxQVvx+zT9JUx3eHl7jD
# Zx+ur/golbfUyFGBxWAZWZjF0p6nqmVd3NtzLNns1A1VePt8J+KOqHCN+BckxSyU
# c9Vj69kR6OsnnvsOj6lJ7YzaHrllUE+sPx6R+ZgT7MewxVNccgUEW/pdiUfDfLN+
# FEXVE0QxkoiRgiMov4kjujIpoGV5iduZnf6wDngXsjiAJANM+aKlBK74GCna9MAh
# A0ZYv7QnCg3IVOq1WFmU0uchNZ2ayOnQyv5xKUCbMYmFjWyWpKGCFv0wghb5Bgor
# BgEEAYI3AwMBMYIW6TCCFuUGCSqGSIb3DQEHAqCCFtYwghbSAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFRBgsqhkiG9w0BCRABBKCCAUAEggE8MIIBOAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCBMi0Kg3tAa2IX59HdvKQfMvj5i70Hok+m1
# o4Da5lV7XgIGZDfqlJ4YGBMyMDIzMDUxMDE2MjgyOC44NzRaMASAAgH0oIHQpIHN
# MIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMg
# VFNTIEVTTjpFQUNFLUUzMTYtQzkxRDElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZaCCEVQwggcMMIIE9KADAgECAhMzAAABw4tv00i/DpFdAAEA
# AAHDMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTIyMTEwNDE5MDEyOVoXDTI0MDIwMjE5MDEyOVowgcoxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVy
# aWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkVBQ0UtRTMx
# Ni1DOTFEMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAu+u86s3R/q+ikos80aD42Ym2
# 1NDOZtldNRxMFUxm4o9kVWkSh2c8jOCxJXwV2KFodCTxpGQs9jy5nUI+Lq/bt0HW
# tSYPMPPtet420gzwM1EsR26kbpwlBHxFY4hk3y3AH+1YKf9bhvPs7kPbXbH7gdac
# iteB+F7FoORt9e0D/dsBeG80GZAF2y6LWAj6C2mMqlafXkwbfTyQanuX65Yu+xMp
# yJ1fAREpuR766rePrqlE0KaaeD0nqOgGrTkSZeCMDPH6OtJ00jXMwbIDyH7l4fYR
# eIsTfzN5Gf3Uairsjea+KFy22lU8elnIXjoeyx3pcesH+q5arY1c6HPfeSnkeMok
# /gxnB7P1Mjt7I9EI9thQtMvy/1SUmLG12rBR/DfheE/VJpcm/TYeoV11NfQQnl/j
# BbPbSRBp0HGqTIcWDpY6MgSdBoQET1DvpE4PX4sndNGc1wGyg45pH62ZMfUF/CzG
# Z7iV637RtnQFXDzTxoSEEkdXMdWDJG+jjxoC16lRk1xFnfkA4uoma4mKso7qvE6d
# 27+K6yzISWQ7TjutYLKJnSzNvfiNiuyv/0xxCASSARvOQ3v9cegvM/pnuU9c6s+4
# gmK3+5jhcvnWGQqJE0tpYHmk3bmmBL1gHm9TjBJz5m/8rvHM3Rw3OUhV4/wmAL32
# KmPR5Ubb4ww5HNGiuY0CAwEAAaOCATYwggEyMB0GA1UdDgQWBBQcGL7N2NdvAaK8
# TcLrxMTsa8aB1jAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNV
# HR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Ny
# bC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYI
# KwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAy
# MDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0G
# CSqGSIb3DQEBCwUAA4ICAQDd8qZbHBqdBFRDxGGwDollnRyd0WmUnjqoP+5QCH4v
# MPBt4umHVhJuyeRkDELkTWZuWqK3U1z2HnGatbnETcHUlywlH+3I7R7fU0zKYw2P
# LA+VawCcrnsICgE3242EsEC/Z0YU740NJ/xbuzrGtTEtUIiQvr2ACPJyhsPote8I
# tTf4uNW4Mbo1QP0tjcBKCgEezIC4DYUM0BYCWCmeZmNwAlxfpTliOFEKB9UaSqHS
# s51cH8JY0gqL3LwI9LYfjEO77++HY/nMqXCMi9ihUKoIp2Tfjfzdm5Ng5V+yw8+w
# Xl29RcW4Q4CvHntNfKxT9oQ3J7YBQQEHWJPg8TNR9w4B82FzmrDd8sL6ETvGux5h
# FcwmF+Q2rT5Ma8dYUSdCSg/ihoEYUGJZnZL9nyDp1snflSVX7FpLyALzDDlHBW1C
# JhYVffJRoqz1D4kRooqRBNRaMFMPingywwbEghMheJKNoda7AGgq+1HH1afRlE+9
# qYW9FKMezxeQmf8gcuAuhr9IAXyaF9DF0PJ5f4uhzOSvIC1BkJtzF6op45UYaI7V
# +9X8dcwXbZJnIIAH1cjVO8KEChxKIkpk4Qgy0PocgUwaGWqmLWRu1hQ1WJWnQXvv
# BYeYDGWbj/PtSlywv6m8mujLepfMvJcU25KWklSP2FuNx6aOVfeje+pgbwIQIVQ1
# nTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZIhvcNAQEL
# BQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNV
# BAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4X
# DTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM
# 57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25PhdgM/9cT8dm
# 95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPFdvWGUNzB
# RMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6GnszrYBb
# fowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBpDco2LXCO
# Mcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50ZuyjLVwIYw
# XE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW
# /aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/w
# EPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1qGFphAXPK
# Z6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2
# BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PAPBXbGjfH
# CBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkwEgYJKwYB
# BAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8v
# BO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARVMFMwUQYM
# KwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEF
# BQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBW
# BgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUH
# AQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtp
# L2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG9w0BAQsF
# AAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0xM7U518Jx
# Nj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmCVgADsAW+
# iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449xvNo32X2
# pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wMnosZiefw
# C2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7
# T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2dY3RILLFO
# Ry3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxnGSgkujhL
# mm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3L
# wUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokLjzbaukz5
# m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE
# 0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggLLMIICNAIB
# ATCB+KGB0KSBzTCByjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEmMCQGA1UE
# CxMdVGhhbGVzIFRTUyBFU046RUFDRS1FMzE2LUM5MUQxJTAjBgNVBAMTHE1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoBATAHBgUrDgMCGgMVAPEdL+Ps+h03
# e+SLXdGzuY7tLu7OoIGDMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTAwDQYJKoZIhvcNAQEFBQACBQDoBgANMCIYDzIwMjMwNTEwMTkzNTQxWhgPMjAy
# MzA1MTExOTM1NDFaMHQwOgYKKwYBBAGEWQoEATEsMCowCgIFAOgGAA0CAQAwBwIB
# AAICDAQwBwIBAAICEe8wCgIFAOgHUY0CAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYK
# KwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0BAQUF
# AAOBgQAf+NdV5oR2LRCQ6s8CB/OIcn/XJyBrd+IMHEKuoTRJcnfPQqXOSPvl4475
# U4jvSCLY+rjIDGJOmK2QVvApnrtINc4vQ2YzwfbLb4zhsvAG7oDUalT3RX2MNooy
# X5n+3v8wWpWxIlryz4g5GgFYvoz6gK2nd65ra7HY7n7jVmBz1DGCBA0wggQJAgEB
# MIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABw4tv00i/DpFd
# AAEAAAHDMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcN
# AQkQAQQwLwYJKoZIhvcNAQkEMSIEIEmtiodVGmqHgMSQy4tfFAWUWQRZcCHsD9hz
# Y1NQC4EzMIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQg0vtTm2+SSerh1KiA
# kwrJTALxTfJotlPcDZ2ZSn78KkkwgZgwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMAITMwAAAcOLb9NIvw6RXQABAAABwzAiBCCXIK2xFh4j+aV3zavD
# OfmyVrkuB3yEAlam/1tLDtpcRTANBgkqhkiG9w0BAQsFAASCAgALdTQG0SKwJgO1
# +c9ng6inn+Mc9IqNe2VUvhnP1m6w+3QPw7U1IInJMNo7JTkg2I1mYfc1lCpiTVyA
# /uFXlh7q0FcgxdfvPAzYJ1DYojlrSCAu5rUUEmxyCvZXSkxSMUd2neBnenPCAnuP
# YvelbDoLZQMo8/Nw5+lIVpUc8nJXFPxHW/YCNPPTePnoA5yqOOug+M8FfwJkaVbh
# p7E/H65Zde2ycqasbDxrYyS1aCzsFtv4+cTvb02qskMMHaPHTlmmbehEiF/XlS7u
# aOllmcxUl8VDousWBzymaTxSQXEBH3HqhjJ0ciikoq8APi+GmPSFQnlFXBRrIZ6L
# jfFCuNSXvaRySEPeUIVi8UqNc+X9+/y4ARr5rjGnwQ0ueCsqAsXMbeTWfDs5U3VC
# t+jRrGEFSa6vcotd6QW7St3elhQT85a3p5jxyfNwjP9GWa/uy9jaoktgokYTMr2H
# 85DQtp2ccyXkjOMJMEpjQAzIGAQUCl7+40CFtXo975feybG3wScTOjNre8JnyNVq
# moUpFq3S55w8jl9+FE7eaxsHckr69BS11uqnG6HvY9b30QEwuQuOh9zwD6hp6ioW
# SQGW4mOejYV6n/vk2PeYcr+UXA1UIYJWBz+KZJW27SrQZPFl57QiudTdb+lnBKHc
# FCP8q17vteLXqIQAcnshbEBf94gtLQ==
# SIG # End signature block
