#!/bin/bash
# qFind.sh Created: 11/22/2021 Updated: 04/14/2025
# Robert W. Eckert - rweckert@gmail.com
#        ___________.__            .___
#   _____\_   _____/|__| ____    __| _/
#  / ____/|    __)  |  |/    \  / __ | 
# ( (_|  ||     \   |  |   |  \/ /_/ | 
#  \__   |\___  /   |__|___|  /\____ | 
#     |__|    \/            \/      \/ v:1.1
# A quick and simple file find utility.

fcall="export -f"
bcall="bash -c"
afp=$(dirname "$(realpath "$0")")
export app="$afp/qFind.sh"
export td="/tmp"
export tf="$td/qFind.txt"
export ti="$td/qFind.ini"
export tt="$td/qFind.tmp"
export fr="$td/qFindResults.tmp"
export fl="$td/qFindList.tmp"
export fo="$td/qFindOpen.tmp"

function mMenu {
ff='@sh -c "echo %1!%2 > $tt & $app vResults"'
yad --form --css="$tp" --posx=20 --posy=20 --width=600 --fixed --title="qFind-Menu" --name="mMenu" --window-icon="text-x-script" --f1-action="$app mHelp" --separator="," --item-separator="," --no-buttons --columns=8 \
--field="Path":DIR "$HOME" \
--field="File:text" "" \
--field=">":fbtn "$ff" \
--field="Theme":fbtn "$bcall mTheme" \
--field="Help":fbtn "$bcall mHelp" \
--field="Exit":fbtn "$bcall mExit"
}
$fcall mMenu

# View Results: ========================
function vResults {
gfp=$(cat $tt | awk 'BEGIN {FS="!" } { print $1 }')
gst=$(cat $tt | awk 'BEGIN {FS="!" } { print $2 }')
find $gfp -name "$gst" > "$fl"
echo -n "" > "$fr"

while read -r line; do
fn=$(echo ${line})
echo "$fn" >>  "$fr"
fe=$(echo $fn | awk 'BEGIN {FS="." } { print $2 }')
echo "$fe" >>  "$fr"
find "$fn" -printf "%s,%Cm-%Cd-%CY,%Tr,%u,%M\n" >> "$fr"

i=($i+1)
echo $i
echo "# $((i))%"
done < "$fl" | yad --progress --css="$tp" --text="" --title="Performing qFind Search" --window-icon="dialog-info" --pulsate --auto-close --auto-kill --on-top --center --button=yad-cancel

sed -i 's/,/\n/g' "$fr"
of='@sh -c "echo %s > $fo & $app fOpen"'
ydo=$(yad --list --css="$tp" --posx=20 --posy=115 --width=500 --height=500 --title="qFind-Results" --name="vResults" --window-icon="text-x-script" --dclick-action="$of" --grid-lines="vert" --grid-lines="hor" --search-column="1" --button="Browse Selected":0 --button="Refresh":3 --button="Save Results":2 --button="Close":1 --column="Path" --column="Extension" --column="Size" --column="Date" --column="Modified" --column="Owner" --column="Permissions" < "$fr" > "$tf")
ydo=$?
if [[ $ydo -eq 0 ]]; then $app bFolder; fi
if [[ $ydo -eq 1 ]]; then wmctrl -c 'qFind-Results'; fi
if [[ $ydo -eq 2 ]]; then $app sResults; fi
if [[ $ydo -eq 3 ]]; then $app vResults; fi
}
$fcall vResults

# Load Results: ========================
function lResults {
of='@sh -c "echo %s > $fo & $app fOpen"'
ydo=$(yad --list --css="$tp" --posx=20 --posy=115 --width=500 --height=500 --title="qFind-Results" --name="vResults" --window-icon="text-x-script" --dclick-action="$of" --grid-lines="vert" --grid-lines="hor" --search-column="1" --button="Browse Selected":0 --button="Refresh":3 --button="Save Results":2 --button="Close":1 --column="Path" --column="Extension" --column="Size" --column="Date" --column="Modified" --column="Owner" --column="Permissions" < "$fr" > "$tf")
ydo=$?
if [[ $ydo -eq 0 ]]; then $app bFolder; fi
if [[ $ydo -eq 1 ]]; then wmctrl -c 'qFind-Results'; fi
if [[ $ydo -eq 2 ]]; then $app sResults; fi
if [[ $ydo -eq 3 ]]; then $app vResults; fi
}
$fcall lResults

# Browse Folder: =======================
function bFolder {
read gfp < $tf
bf=$(dirname "$gfp")
xdg-open $bf
lResults
}
$fcall bFolder

# Save Results: ========================
function sResults {
sfa=$(yad --file --save --center)
cp "$fr" "$sfa"
lResults
}
$fcall sResults

# File Open: ===========================
function fOpen {
read gfo < "$fo"
gfn=$(echo $gfo | awk 'BEGIN {FS="." } { print $1 }')
fe1=$(echo $gfo | awk 'BEGIN {FS="." } { print $2 }')
gfe=$(echo $fe1 | awk 'BEGIN {FS=" " } { print $1 }')
xdg-open "$gfn.$gfe"
}
$fcall fOpen

# Menu Theme: ==========================
function mTheme {
gut='@sh -c "echo %2 > $tf & $app tUser"'
gst='@sh -c "echo %5 > $tf & $app tSystem"'
ydo=$(yad --form --css="$tp" --posx=20 --posy=115 --width=300 --fixed --title="qFind-Theme" --name="mTheme" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Help":3 --button="About":2 --button="Close":1 \
--field="Custom Theme"::LBL "" \
--field="Load Theme:FL" "/usr/share/themes/" \
--field="Apply Custom Theme":fbtn "$gut" \
--field="System Default"::LBL "" \
--field="Mode:CB" "Light Theme\!Dark Theme" \
--field="Apply System Theme":fbtn "$gst" \
--field="Browse Themes Folder":fbtn "$app tBrowse" 2> /dev/null)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'qFind-Theme'; fi
if [[ $ydo -eq 2 ]]; then mAbout; fi
if [[ $ydo -eq 3 ]]; then mHelp; fi
}
$fcall mTheme

# User Selected Theme: =================
function tUser {
read gut < "$tf"
sed -i '/stheme:/d' $ti
echo "stheme:$gut" >> "$ti"
tApply
}
$fcall tUser

# System Theme: ========================
function tSystem {
read gst < "$tf"
if [ "$gst" = "Dark Theme" ]; then
sed -i '/stheme:/d' $ti
echo "stheme:/usr/share/themes/Breeze-Dark/gtk-4.0/gtk.css" >> "$ti"
fi
if [ "$gst" = "Light Theme" ]; then
sed -i '/stheme:/d' $ti
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
fi
tApply
}
$fcall tSystem

# Apply Theme: =========================
function tApply {
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
wmctrl -c 'qFind-Menu'
wmctrl -c 'qFind-Theme'
mMenu
}
$fcall tApply

# Main Help: ===========================
function mHelp {
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="qFind-Documentation" --name="mHelp" --window-icon="text-html"  --uri="/home/rweckert/WinXBin/Source/qFind/readme-qFind.txt" --file-op
}
$fcall mHelp

# Load Menu: ===========================
function mLoad {
if test -f "$ti"; then
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
mMenu
else
export tp=""
mMenu
fi
}
$fcall mLoad

# Exit and Cleanup =====================
function mExit {
wmctrl -c 'qFind-Menu'
wmctrl -c 'qFind-Results'
wmctrl -c 'qFind-Theme'
wmctrl -c 'qFind-Documentation'
rm -f "$tf"
rm -f "$tt"
rm -f "$fr"
rm -f "$fl"
rm -f "$fo"
exit
}
$fcall mExit

# About ================================
function mAbout {
yad --about --css="$tp" \
--window-icon="text-x-script" \
--image="text-x-script" \
--authors="Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="A quick and simple file find utility." \
--copyright="Updated 04/14/2025 by Robert W Eckert" \
--pversion="Version: 1.1" \
--pname="qFind" \
--button="Close!gtk-close":1
}
$fcall mAbout

if [ -z "$1" ]; then mLoad; else $1; fi
