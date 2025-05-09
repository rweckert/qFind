# <img align="left" width="48" src="Icon-qFind.png" /> qFind
qFind is a quick and simple file find utility for Linux.

### Script Purpose as a Tool:
Open qFind and select the directory to search regarding a file. Inside the text box "File" type in the filename (or partial filename) you are looking for. To perform the search click on the ">" button. A search for the file will begin showing you progress of the search. Search results then appear displaying all items located that match the search. Search results display full path of the file found and the capability of sorting by file extension, size, creation date, modified date, owner and permissions.

![qFind Screenshot](https://github.com/rweckert/qFind/blob/main/screenshot-qFind-04-14-2025.jpg)

### Setup:
1. Please review "[Common System Requirements](https://github.com/rweckert/qFind/blob/main/README.md#common-system-requirements)" and "[Critical System Requirements](https://github.com/rweckert/qFind/blob/main/README.md#critical-system-requirements)" sections below for basic and critical requirements to run this script successfully.
2. Save the qFind.sh file to a directory.
3. Make the qFind.sh script executable by running the following command in the same directory as the qFind.sh file:<br/>
_chmod +x qFind.sh_

### Features:
- Search results can also be sorted by file extension, size, creation date, modified date, owner and permissions.
- Select file found and browse folder that contains the listed file.
- Open located file in search results by double click.
- Multiple search results windows can be viewed at once.
- Save search results to file.
- Use the 'F1' key for documentation from any main window.

### Typical Usage:
Open qFind and select the directory to search regarding a file. Inside the text box "File" type in the filename (or partial filename) you are looking for. qFind accepts wildcard file searching such as '*'. To perform the search click on the ">" button to start the search. A search of the file will begin showing you progress of the search. Once the search results appear you can sort by path, file extension, size, creation date, modified date, owner and permissions. Options include from the search result window to browse selected path, save search results, refresh search results of to close.

### Detailed Options and Usage:
**- Path:** Locate the path of where the search will locate the file you are looking for. This by default starts at the home directory. Sub-folders are searched by default.<br/>
**- File:** Type in the filename you are looking for. The search is case sensitive. You can use the '*' wildcard when performing a search.<br/>
**- >:** This starts the search process using the selected path and filename entered. A progress meter will appear showing you progress of the search. You can cancel the search process if needed.<br/>
**- Theme:** Enables you to select a system theme or a user defined theme. Please review "Theme Options" below for more information.<br/>
**- Help:** Opens the help documentation for the script.<br/>
**- Exit:** Closes all windows of the qFind script.

### Theme Options:
When viewing the "Theme" option, the following options are available:<br/>
**- Load Theme:** Allows the user to browse their system for a theme to use.<br/>
**- Apply Loaded Theme:** Applies the loaded theme. Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Mode:** Select basic system theme available in the system for "Light Theme" or "Dark Theme". This default uses the "Breeze" theme package located in the "/usr/share/themes/" folder.<br/>
**- Apply System Theme:** Applies the Mode selected for either "Light Theme" or "Dark Theme". Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Browse Themes Folder:** Browse the default themes folder "/usr/share/themes/".<br/>
**- Help:** Opens qFind help documentation.<br/>
**- About:** Opens the about window showing script credits.<br/>
**- Close:** Closes the "Options" window.

### Notes:
- qFind can be ran from any directory.
- qFind uses the "/tmp/" folder for temporary and .ini files.
- Performing a search starting from the home or root directory can take some time in order to search the entire storage device.
- A search with no results found will display a blank results window.

### qFind Shortcut File: <br/>
Save the following as a file named "qFind.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored:<br/>
[Desktop Entry]<br/>
Name=qFind<br/>
GenericName=qFind<br/>
Comment=A quick and simple file find utility.<br/>
Exec=/PathToScript/qFind.sh<br/>
Type=Application<br/>
Icon=gtk-find<br/>
Terminal=false<br/>

### Common System Requirements:
Common shell commands found in most Linux installations are used to provide system functionalilty for this and other scripts shared from this profile. For thoroughness, these common shell commands are listed in alphabetical order with version and man page link for review: [https://github.com/rweckert/qFind/blob/a004ec8ad76cfc68f9db95ec9c758e7225bf9919/README-Basic-Requirements.md](https://github.com/rweckert/qFind/blob/a004ec8ad76cfc68f9db95ec9c758e7225bf9919/README-Basic-Requirements.md)

### Critical System Requirements:
Packages listed below provide the core ingredients for graphic display and desired output that enables qFind to deliver output and are critical for successful execution of the the script:
| Package       | Version              | Notes         |
|     :---:     |         :---:        | :---          |
| yad           | 14.0+ (GTK+ 3.24.41) | A tool for developing graphical user interfaces in Linux and is used by this script to generate menus and dialog windows, is written by Victor Ananjevsky. **Download:** [https://github.com/v1cont/yad](https://github.com/v1cont/yad) **Setup:** Step by step instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch) |

### Project Contents:
**Project Page:** <br/>
[https://github.com/rweckert/qFind](https://github.com/rweckert/qFind) <br/>
**Source File:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/qFind.sh](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/qFind.sh) <br/>
**Documentation File:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/README.md](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/README.md) <br/>
**Project Screenshot:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/screenshot-qFind-04-14-2025.jpg](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/screenshot-qFind-04-14-2025.jpg) <br/>
**Project License:** <br/>
[https://github.com/rweckert/qFind/blob/a004ec8ad76cfc68f9db95ec9c758e7225bf9919/LICENSE](https://github.com/rweckert/qFind/blob/a004ec8ad76cfc68f9db95ec9c758e7225bf9919/LICENSE) <br/>
**GitHub Profile Page:** <br/>
[https://github.com/rweckert](https://github.com/rweckert)
