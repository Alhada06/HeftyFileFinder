$splashTitle = @"
 |   |         _|  |               ____| _)  |            ____| _)             |             
 |   |   _ \  |    __|  |   |      |      |  |   _ \      |      |   __ \   _  |   _ \   __| 
 ___ |   __/  __|  |    |   |      __|    |  |   __/      __|    |  |   |  (   |   __/  |    
_|  _| \___| _|   \__| \__, |     _|     _| _| \___|     _|     _| _|  _| \__,_| \___| _|    
                       ____/`n
"@

#================================================================================================================================================#
#=SETTINGS=======================================================================================================================================#

$skipFolders = @(
    "C:\Example\Folder",
    "C:\Other\Example\Folder"
)

$verboseSuccess = $false
$verboseFails   = $true
$verboseSkips   = $true

$logSuccess = $false
$logFails   = $true
$logSkips   = $true

# HTML settings
$font            = "Cascadia Mono"
$backgroundColor = "#202020"
$foregroundColor = "#f2f2f2"
$headerColor     = "#77c387"

# Icon Themes
$materialDesignIcons = @(
    <# SVG Width #> "24",
    <# SVG Height #> "24",
    <# SVG Viewbox #> "0 0 24 24",
    <# File #> "M6 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm0 2h7v5h5v11H6zm2 8v2h8v-2zm0 4v2h5v-2z",
    <# Folder #> "M10 4H4c-1.11 0-2 .89-2 2v12a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-8z",
    <# Folder Open #> "M19 20H4a2 2 0 0 1-2-2V6c0-1.11.89-2 2-2h6l2 2h7a2 2 0 0 1 2 2H4v10l2.14-8h17.07l-2.28 8.5c-.23.87-1.01 1.5-1.93 1.5"
)
$mingcuteIcon = @(
    <# SVG Width #> "32",
    <# SVG Height #> "32",
    <# SVG Viewbox #> "0 0 24 24",
    <# File #> "M18 2a2 2 0 0 1 2 2v16a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm-6 11H9a1 1 0 1 0 0 2h3a1 1 0 1 0 0-2m3-5H9a1 1 0 0 0-.117 1.993L9 10h6a1 1 0 0 0 .117-1.993z",
    <# Folder #> "M2 5a2 2 0 0 1 2-2h5.52a2 2 0 0 1 1.561.75l1.4 1.75H20a2 2 0 0 1 2 2V19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2z",
    <# Folder Open #> "M21.328 10a.5.5 0 0 1 .496.563l-.017.08l-2.89 9.644a1 1 0 0 1-.84.706L17.96 21H4a2 2 0 0 1-1.099-.328a.5.5 0 0 1-.026-.234l.017-.082l2.894-9.643a1 1 0 0 1 .839-.706L6.744 10zM9.52 3a2 2 0 0 1 1.443.614l.12.137L12.48 5.5H19a2 2 0 0 1 1.995 1.85L21 7.5V8H6.744A3 3 0 0 0 3.93 9.96l-.06.178L2 16.37V5a2 2 0 0 1 1.85-1.995L4 3z"
)
$phosphor = @(
    <# Width #> "24",
    <# Height #> "24",
    <# Viewbox #> "0 0 256 256",
    <# File #> "m213.66 82.34l-56-56A8 8 0 0 0 152 24H56a16 16 0 0 0-16 16v176a16 16 0 0 0 16 16h144a16 16 0 0 0 16-16V88a8 8 0 0 0-2.34-5.66M160 176H96a8 8 0 0 1 0-16h64a8 8 0 0 1 0 16m0-32H96a8 8 0 0 1 0-16h64a8 8 0 0 1 0 16m-8-56V44l44 44Z",
    <# Folder #> "M232 88v112.89A15.13 15.13 0 0 1 216.89 216H40a16 16 0 0 1-16-16V64a16 16 0 0 1 16-16h53.33a16.12 16.12 0 0 1 9.6 3.2L130.67 72H216a16 16 0 0 1 16 16",
    <# Folder Open #> "M245 110.64a16 16 0 0 0-13-6.64h-16V88a16 16 0 0 0-16-16h-69.33l-27.73-20.8a16.14 16.14 0 0 0-9.6-3.2H40a16 16 0 0 0-16 16v144a8 8 0 0 0 8 8h179.1a8 8 0 0 0 7.59-5.47l28.49-85.47a16.05 16.05 0 0 0-2.18-14.42M93.34 64l27.73 20.8a16.12 16.12 0 0 0 9.6 3.2H200v16h-53.57a16 16 0 0 0-8.88 2.69l-20 13.31H69.42a15.94 15.94 0 0 0-14.86 10.06L40 166.46V64Z"
)
$clarity = @(
    <# Width #> "32",
    <# Height #> "32",
    <# Viewbox #> "0 0 36 36",
    <# File #> "M21.89 4H7.83A1.88 1.88 0 0 0 6 5.91v24.18A1.88 1.88 0 0 0 7.83 32h20.34A1.88 1.88 0 0 0 30 30.09V11.92ZM21 13V5.84L28.3 13Z",
    <# Folder #> "M30 9H16.42l-2.31-3.18A2 2 0 0 0 12.49 5H6a2 2 0 0 0-2 2v22a2 2 0 0 0 2 2h24a2 2 0 0 0 2-2V11a2 2 0 0 0-2-2M6 11V7h6.49l2.72 4Z",
    <# Folder Open #> "M35.32 13.74a1.71 1.71 0 0 0-1.45-.74h-22.7a2.59 2.59 0 0 0-2.25 1.52a1 1 0 0 0 0 .14L6 25V7h6.49l2.61 3.59a1 1 0 0 0 .81.41H32a2 2 0 0 0-2-2H16.42l-2.31-3.18A2 2 0 0 0 12.49 5H6a2 2 0 0 0-2 2v22.69A1.37 1.37 0 0 0 5.41 31h24.93a1 1 0 0 0 1-.72l4.19-15.1a1.64 1.64 0 0 0-.21-1.44"
)
$antDesignIcons = @(
    <# Width #> "32",
    <# Height #> "32",
    <# Viewbox #> "0 0 1024 1024",
    <# File #> "M854.6 288.7c6 6 9.4 14.1 9.4 22.6V928c0 17.7-14.3 32-32 32H192c-17.7 0-32-14.3-32-32V96c0-17.7 14.3-32 32-32h424.7c8.5 0 16.7 3.4 22.7 9.4zM790.2 326L602 137.8V326zM320 482a8 8 0 0 0-8 8v48a8 8 0 0 0 8 8h384a8 8 0 0 0 8-8v-48a8 8 0 0 0-8-8zm0 136a8 8 0 0 0-8 8v48a8 8 0 0 0 8 8h184a8 8 0 0 0 8-8v-48a8 8 0 0 0-8-8z",
    <# Folder #> "M880 298.4H521L403.7 186.2a8.15 8.15 0 0 0-5.5-2.2H144c-17.7 0-32 14.3-32 32v592c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V330.4c0-17.7-14.3-32-32-32",
    <# Folder Open #> "M928 444H820V330.4c0-17.7-14.3-32-32-32H473L355.7 186.2a8.15 8.15 0 0 0-5.5-2.2H96c-17.7 0-32 14.3-32 32v592c0 17.7 14.3 32 32 32h698c13 0 24.8-7.9 29.7-20l134-332c1.5-3.8 2.3-7.9 2.3-12c0-17.7-14.3-32-32-32m-180 0H238c-13 0-24.8 7.9-29.7 20L136 643.2V256h188.5l119.6 114.4H748z"
)

# Icon Settings
$iconTheme  = $phosphor

# Icon color according to file/directory occupancy index
$gradient0 = "#F2F2F2"
$gradient1 = "#F1DFE0"
$gradient2 = "#F0CCCF"
$gradient3 = "#EEB9BD"
$gradient4 = "#EDA6AB"
$gradient5 = "#EC929A"
$gradient6 = "#EB7F88"
$gradient7 = "#E96C76"
$gradient8 = "#E85965"
$gradient9 = "#E74653"


#================================================================================================================================================#
#=CLASSES========================================================================================================================================#

class Path {

    [string]$path
    [int64]$size
    [bool]$isDirectory
    [array]$subPaths
    [bool]$failed
    [float]$occupancy
    
    Path([string]$path) { 
        $this.path = $path
        $this.size = 0
        $this.isDirectory = $false
        $this.subPaths = @()
        $this.failed = $false
        $this.occupancy = 0
    }

}

#================================================================================================================================================#
#=FUNCTIONS======================================================================================================================================#

function LogFail {
    param (
        [Parameter(Mandatory=$true)]
        [string]$LogPath,
        [Parameter(Mandatory=$true)]
        [string]$FailedPath,
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.ErrorRecord]$ErrorRecord
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $errorMessage = $ErrorRecord.Exception.Message
    $errorDetails = $ErrorRecord.ScriptStackTrace
    $errorLocation = $ErrorRecord.InvocationInfo.PositionMessage

    $logEntry = "[$timestamp] [FAILED]  $FailedPath`nErrorMessage: $errorMessage`nDetails: $errorDetails`nLocation: $errorLocation`n"
    
    Add-Content -Path $LogPath -Value $logEntry
}

#================================================================================================================================================#

function LogMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Type,
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [Parameter(Mandatory=$true)]
        [string]$LogPath
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timeStamp] [$Type] $Message"

    Add-Content -Path $LogPath -Value $logEntry
}

#================================================================================================================================================#

function PathSearch {
    Param(
        [parameter(Mandatory=$true)]
        [string]$RootPath
    )

    Write-Host "`nSCAN STARTED..." -ForegroundColor Green
    
    function Recurse {
        Param(
            [parameter(Mandatory=$true)]
            [string]$CurrentPath
        )

        # Skip specified folders
        if ($skipFolders -contains $CurrentPath) {
            if ($verboseSkips) { Write-Host "[SKIPPED] " -NoNewLine -ForegroundColor Yellow; Write-Host $CurrentPath }
            if ($logSkips)     { LogMessage -Type "SKIPPED" -Message $CurrentPath -LogPath $logPath }
            return $null
        }

        # Create the Current Path Object
        $currentPathObject = [Path]::new($CurrentPath)

        # Determine if the Current Path Object is a directory
        try { $currentItem = Get-ChildItem -Path $CurrentPath -ErrorAction Stop } catch { 
            $currentPathObject.failed = $true
            if ($verboseFails) { Write-Host "[FAILED]  " -NoNewLine -ForegroundColor Red; Write-Host $CurrentPath }
            if ($logFails)     { LogFail -LogPath $logPath -FailedPath $CurrentPath -ErrorRecord $_ }
            return $currentPathObject
        }

        # If it is a directory...
        if ($currentItem.PSIsContainer) { 

            $currentPathObject.isDirectory = $true

            # Get all children of the CurrentPath add them to the subPaths array of the Current Path Object and sum their sizes to the size property of the Current Path Object
            try {
                Get-ChildItem -Path $CurrentPath -ErrorAction Stop | ForEach-Object {
                    $currentItemChildren = Recurse -CurrentPath $_.FullName
                    if ($null -ne $currentItemChildren) {
                        $currentPathObject.subPaths += $currentItemChildren
                        $currentPathObject.size += $currentItemChildren.size
                    }
                }
                if ($verboseSuccess) { Write-Host "[SCANNED] " -NoNewLine -ForegroundColor Green; Write-Host $CurrentPath }
                if ($logSuccess)     { LogMessage -Type "SCANNED" -Message $CurrentPath -LogPath $logPath }

            } catch {
                if ($verboseFails) { Write-Host "[FAILED]  " -NoNewLine -ForegroundColor Red; Write-Host $CurrentPath }
                if ($logFails)     { LogFail -LogPath $logPath -FailedPath $CurrentPath -ErrorRecord $_ }
            }

            # Sort the subPaths array by size of the subPaths
            $currentPathObject.subPaths = $currentPathObject.subPaths | Sort-Object -Property size -Descending

            # Calculate the occupancy of each subPath in the CurrentPathObject
            foreach ($subPathObject in $currentPathObject.subPaths) {
                if($currentPathObject.size -ne 0) { $subPathObject.occupancy = $subPathObject.size * 100 / $currentPathObject.size }
            }

         
        } else {

            $currentPathObject.size = [System.IO.FileInfo]::new($CurrentPath).Length
            if ($verboseSuccess) { Write-Host "[SCANNED] " -NoNewLine -ForegroundColor Green; Write-Host $CurrentPath }
            if ($logSuccess)     { LogMessage -Type "SCANNED" -Message $CurrentPath -LogPath $logPath }

        }

        return $currentPathObject

    }

    $rootPathObject = Recurse -CurrentPath $RootPath
    $rootPathObject.occupancy = 100

    Write-Host "SCAN FINISHED!" -ForegroundColor Green
    
    return $rootPathObject

}

#================================================================================================================================================#

function GetGradient {
    Param(
        [parameter(Mandatory=$true)]
        [float]$Value
    )

    switch($Value) {
        0  { return $gradient0 }
        1  { return $gradient1 } 
        2  { return $gradient2 } 
        3  { return $gradient3 } 
        4  { return $gradient4 } 
        5  { return $gradient5 } 
        6  { return $gradient6 } 
        7  { return $gradient7 } 
        8  { return $gradient8 } 
        9  { return $gradient9 } 
    }

}

#================================================================================================================================================#

function ExportHTML {
    Param(
        [parameter(Mandatory=$true)]
        [Path]$Results,
        [parameter(Mandatory=$true)]
        [string]$HTMLPath
    )

    $iconWidth      = $iconTheme[0]
    $iconHeight     = $iconTheme[1]
    $iconViewbox    = $iconTheme[2]
    $iconFile       = $iconTheme[3]
    $iconFolder     = $iconTheme[4]
    $iconFolderOpen = $iconTheme[5]

    $htmlHeader = @"
    <!DOCTYPE html>
    <html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>Hefty File Finder - Results</title>
        <style>
            body {
                font-family: '$font';
                background-color: $backgroundColor;
                color: $foregroundColor;
            }
            h1, h4 {
                color: $headerColor;
            }
            .directory, .file {
                cursor: pointer;
                margin: 5px 0;
                display: flex;
                align-items: center;
            }
            .nested {
                display: none;
                margin-left: 20px;
            }
            .active {
                display: block;
            }
          
            .icon {
                display: inline-block;
                width: 1.5em;
                height: 1.5em;
                margin-right: 10px;
                background-color: currentColor;
                -webkit-mask-image: var(--svg);
                mask-image: var(--svg);
                -webkit-mask-repeat: no-repeat;
                mask-repeat: no-repeat;
                -webkit-mask-size: 100% 100%;
                mask-size: 100% 100%;
            }

            .icon-file {
                 --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='$iconViewbox' width='$iconWidth' height='$iconHeight'%3E%3Cpath fill='black' d='$iconFile'/%3E%3C/svg%3E");
            }

            .icon-folder {
                --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='$iconViewbox' width='$iconWidth' height='$iconHeight'%3E%3Cpath fill='black' d='$iconFolder'/%3E%3C/svg%3E");
            }

            .icon-folder-open {
                --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='$iconViewbox' width='$iconWidth' height='$iconHeight'%3E%3Cpath fill='black' d='$iconFolderOpen'/%3E%3C/svg%3E");
            }

        </style>
    </head>
    <body>
        <h1>HEFTY FILE FINDER RESULTS</h1>
        <h4>[HOST] $(hostname)</br>[TIME] $startTime</h4><hr color="$headerColor"></br>
        
"@

    $htmlFooter = @"
        <script>
            document.querySelectorAll('.directory').forEach(dir => {
                dir.addEventListener('click', function() {
                    const nested = this.nextElementSibling;
                    nested.classList.toggle('active');
                    const icon = this.querySelector('span.icon');
                    const occupancyIndex = parseFloat(this.getAttribute('occupancy-index'));
                    if (nested.classList.contains('active')) {
                        icon.classList.remove('icon-folder');
                        icon.classList.add('icon-folder-open');
                    } else {
                        icon.classList.remove('icon-folder-open');icon.classList.add('icon-folder');
                    }
                });
            });
        </script>
    </body>
    </html>
"@

    function Recurse {
        Param(
            [parameter(Mandatory=$true)]
            [Path]$CurrentPathObject,
            [parameter(Mandatory=$false)]
            [string]$Indent
        )

        $occupancy = [Math]::Round($CurrentPathObject.occupancy, 2)
        $occupancyIndex = [math]::Floor($occupancy / 10)
        if($occupancyIndex -eq 10) { $occupancyIndex = 9 }
        $occupancyColor = GetGradient -Value $occupancyIndex

        if ($CurrentPathObject.isDirectory) {
            $htmlBuilder.Append("<div class='directory' occupancy-index='$occupancyIndex'>$Indent<span class='icon icon-folder' style='color: $occupancyColor;' ></span><span style='color: $occupancyColor;'>$($CurrentPathObject.path)<b>&nbsp;[SIZE] $([Math]::Round($CurrentPathObject.size / 1MB, 2)) MB [OCCUPANCY] $occupancy%</span></b></div>`n<div class='nested'>`n") | Out-Null
            foreach ($pathObject in $CurrentPathObject.subPaths) {
                Recurse -CurrentPathObject $pathObject -Indent ($Indent + "&nbsp;&nbsp;&nbsp;&nbsp;")
            }
            $htmlBuilder.Append("</div>`n") | Out-Null

        } else {

            $htmlBuilder.Append("<div class='file'>$Indent<span class='icon icon-file' style='color: $occupancyColor;'></span><span style='color: $occupancyColor;'>$($CurrentPathObject.path) <b> [SIZE] $([Math]::Round($CurrentPathObject.size / 1MB, 2)) MB [OCCUPANCY] $([Math]::Round($CurrentPathObject.occupancy, 2))%</span></b></div>`n") | Out-Null
        }

    }

    Write-Host "EXPORTING HTML..." -ForegroundColor Green

    $htmlBuilder = New-Object System.Text.StringBuilder
    $htmlBuilder.Append($htmlHeader) | Out-Null
    Recurse -CurrentPathObject $Results 
    $htmlBuilder.Append($htmlFooter) | Out-Null
    [System.IO.File]::WriteAllText($HTMLPath, $htmlBuilder.ToString())

    Write-Host "EXPORTED HTML!`n" -ForegroundColor Green

}

#================================================================================================================================================#
#=MAIN=SCRIPT====================================================================================================================================#

Write-Host $splashTitle -ForegroundColor Green

$rootPath = Read-Host "Enter Search Path"
if (-not(Test-Path $rootPath)) { Write-Host "Inexistent path" -ForegroundColor Red; exit }

$startTime = Get-Date -Format "yyyy-MM-dd_HH.mm.sss"
$logPath   = Join-Path -Path (Get-Location) -ChildPath "$(hostname)_$startTime.log"
$htmlPath  = Join-Path -Path (Get-Location) -ChildPath "$(hostname)_$startTime.html"

$searchResults = PathSearch -RootPath $rootPath
ExportHTML -Results $searchResults -HTMLPath $htmlPath

Write-Host "HTML exported to: $htmlPath"
if (Test-Path $logPath) { Write-Host "Log exported to:  $logPath" }
Write-Host ""