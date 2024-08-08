# HEFTY FILE FINDER
Hefty File Finder is a PowerShell script designed to recursively scan every sub-directory and file of a given path, collecting size information about every found file and directory and sorting the results by size. The results of the scan are then exported into an HTML file, organized into expandable/collapsible divs, sorted by size, and colored by an occupancy index. Optionally, the script can also output a comprehensible and customizable log file.

## Usage

Open PowerShell in a terminal emulator, change the directory to the directory where the script is located, execute the script, and provide the absolute root path you want to scan. The results will be output into the current working directory. To analyze the results, open the resulting HTML file and click on any directory path to expand/collapse it. Size is represented in megabytes, and occupancy represents how much space a file/directory proportionally occupies in the directory it resides.

## Settings

**Settings are defined in variables at the top of the script itself:**

* **$skipFolders**
    - Array of absolute paths which you don't want the script to scan.
* **$log***__<Success/Fails/Skips>__*
    - True/false values, set which kind of information you want to be logged.
* **$verbose***__<Success/Fails/Skips>__*
    - True/false values, set which kind of information you want to be verbosed in the console.
* **$font**
    - Font to be used in the results HTML file 
* **$*****<background/foreground/header>***__Color__
    - *background* - background color for the whole page.
    - *foreground* - color for unstyled text in the page (unused).
    - *header* - color for text in the heder section of the page.
* **$iconTheme**
    - Your chosen icon theme, the script comes packed with 5:
    - **$materialDesignIcons**, **$mingcuteIcon**, **$phosphor**, **$clarity** and **$antDesignIcons**.
* **$gradient***__<0-9>__*
    - Occupancy colors, 0 is 0% to 9.999...%, 1 is 10% to 19.999...%, 9 is 90% to 100%. This only affects text, not icons.

## FAQs
* **Where can I get new icon themes?**
>
You can get them from various places, the ones in the script were obtained from https://icones.js.org/.
You can also make your own using W3 SVG standard https://www.w3.org/TR/SVG2/.

* **The script is too slow! What do I do?**
>
Set ***$verboseSuccess*** and **$logSuccess*** to ***$false***. Still slow? Disable all other verbose and logging settings. Still slow? There is always room for improvement, but you are likely running into hardware limitation issues.

* **There is already other software that does this and more.**
>
Like any other software that does X. This is a minimalistic, portable, customizable, free and open-source alternative, conceived to run from a shell.

* **Can I run this on Linux, MacOS, etc...?**
>
The script was written and tested for PowerShell 5.1 to maximize compatibility with modern Windows operating systems. PowerShell 5.1 runs on top of the .NET framework, hence, it is unlikely to be compatible with versions of PowerShell that run on .NET Core.