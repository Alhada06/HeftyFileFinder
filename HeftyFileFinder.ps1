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

$logSuccess = $true
$logFails   = $true
$logSkips   = $true

# HTML settings
$font            = "Cascadia Mono"
$backgroundColor = "#202020"
$foregroundColor = "#f2f2f2"
$headerColor     = "#77c387"

$gradient0       = "#F2F2F2"
$gradient1       = "#F1DFE0"
$gradient2       = "#F0CCCF"
$gradient3       = "#EEB9BD"
$gradient4       = "#EDA6AB"
$gradient5       = "#EC929A"
$gradient6       = "#EB7F88"
$gradient7       = "#E96C76"
$gradient8       = "#E85965"
$gradient9       = "#E74653"


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
          

            .icon--mdi {
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

            .icon--mdi--file-document-outline {
                 --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' width='24' height='24'%3E%3Cpath fill='black' d='M6 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm0 2h7v5h5v11H6zm2 8v2h8v-2zm0 4v2h5v-2z'/%3E%3C/svg%3E");
            }

            .icon--mdi--folder {
                --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' width='24' height='24'%3E%3Cpath fill='black' d='M10 4H4c-1.11 0-2 .89-2 2v12a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-8z'/%3E%3C/svg%3E");
            }

            .icon--mdi--folder-open {
                --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' width='24' height='24'%3E%3Cpath fill='black' d='M19 20H4a2 2 0 0 1-2-2V6c0-1.11.89-2 2-2h6l2 2h7a2 2 0 0 1 2 2H4v10l2.14-8h17.07l-2.28 8.5c-.23.87-1.01 1.5-1.93 1.5'/%3E%3C/svg%3E");
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
                    const icon = this.querySelector('span.icon--mdi');
                    const occupancyIndex = parseFloat(this.getAttribute('occupancy-index'));
                    if (nested.classList.contains('active')) {
                        icon.classList.remove('icon--mdi--folder');
                        icon.classList.add('icon--mdi--folder-open');
                    } else {
                        icon.classList.remove('icon--mdi--folder-open');icon.classList.add('icon--mdi--folder');
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
            $htmlBuilder.Append("<div class='directory' occupancy-index='$occupancyIndex'>$Indent<span class='icon--mdi icon--mdi--folder' style='color: $occupancyColor;' ></span><span style='color: $occupancyColor;'>$($CurrentPathObject.path)<b>&nbsp;[SIZE] $([Math]::Round($CurrentPathObject.size / 1MB, 2)) MB [OCCUPANCY] $occupancy%</span></b></div>`n<div class='nested'>`n") | Out-Null
            foreach ($pathObject in $CurrentPathObject.subPaths) {
                Recurse -CurrentPathObject $pathObject -Indent ($Indent + "&nbsp;&nbsp;&nbsp;&nbsp;")
            }
            $htmlBuilder.Append("</div>`n") | Out-Null

        } else {

            $htmlBuilder.Append("<div class='file'>$Indent<span class='icon--mdi icon--mdi--file-document-outline' style='color: $occupancyColor;'></span><span style='color: $occupancyColor;'>$($CurrentPathObject.path) <b> [SIZE] $([Math]::Round($CurrentPathObject.size / 1MB, 2)) MB [OCCUPANCY] $([Math]::Round($CurrentPathObject.occupancy, 2))%</span></b></div>`n") | Out-Null
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