# qFind
qFind is a quick and simple file find utility for Linux.

### Script Purpose as a Tool:
Open qFind and select the directory to search regarding a file. Inside the text box "File" type in the filename (or partial filename) you are looking for. To perform the search click on the ">" button. A search for the file will begin showing you progress of the search. Search results then appear showing you all items located that match the search.

![qFind Screenshot](https://github.com/rweckert/qFind/blob/main/screenshot-qFind-04-14-2025.jpg)

### Setup:
1) Save the qFind.sh file to a directory.
2) Make the qFind.sh script executable by running the following command in the same directory as the qFind.sh file:<br/>
_chmod +x qFind.sh_

### Features:
- Find results can also be sorted by file extension, size, creation date, modified date, owner and permissions.
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

### Common System Requirements:
The following applications are in general use of most Linux systems and are used in having qFind deliver output:
- awk
- basename
- cp
- find
- read
- rm
- sed
- while
- wmctrl
- xdg-open

### Critical System Requirements:
The most important requirement is the yad (yet another dialog) application which allows for the use of custom dialog, menu, and window options.

- yad 14.0+ (GTK+ 3.24.41) [https://github.com/v1cont/yad](https://github.com/v1cont/yad)

The qFind script uses features of yad that do require version 14.0+ and built with GTK+ 3.24.41 or higher. Full setup instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch)

YAD (Yet Another Dialog), a tool for developing graphical user interfaces in Linux, is written by Victor Ananjevsky.

Script interface written by: Robert W. Eckert - rweckert@gmail.com
Please feel free to email to submit bugs, changes or requests.

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

### Project Contents:
**Project Page:** <br/>
[https://github.com/rweckert/qFind](https://github.com/rweckert/qFind)<br/>
**Source File:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/qFind.sh](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/qFind.sh)<br/>
**Documentation File:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/README.md](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/README.md)<br/>
**Project Screenshot:** <br/>
[https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/screenshot-qFind-04-14-2025.jpg](https://github.com/rweckert/qFind/blob/90a9d4ed8c3fc0b7858694997d1b6650066edda6/screenshot-qFind-04-14-2025.jpg)
