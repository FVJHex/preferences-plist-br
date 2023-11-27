#!/bin/bash
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
######################################################################################################################################################
# Author: FVJHex
#
# Description: Backups and restores the preferences.plist file located at "/Library/Preferences/SystemConfiguration/preferences.plist".
#              The preferences.plist file is backed up to a zip folder in the users home directory.
#              THE SCRIPT NEEDS TO BE RAN WITH ADMIN PRIVILEGES TO RESTORE FILE!
# 
# Usage: sh <path to script> | sudo sh <path to script> | su -m <admin user> -c <path to script>
#
# Examples: sh preferences_plist_backup_restore.sh | sudo preferences_plist_backup_restore | su -m admin preferences_plist_backup_restore.sh
######################################################################################################################################################

run=true

while [ $run == "true" ]; do

    clear

    echo "----------------------------------------------"
    echo "----- PREFERENCES.PLIST BACKUP & RESTORE -----"
    echo "----------------------------------------------"
    echo "1 - Backup preferences.plist"
    echo "2 - Restore preferences.plist"
    echo ""

    # While loop to ask user for input until a valid option is provided
    get_input=true
    while [ $get_input == "true" ]; do
        read -rp "ENTER 1 or 2: " tool_selector
        if [[ $tool_selector =~ [^[:digit:]] ]]; then
            echo "INVALID OPTION ENTERED!"
        else
            if [[ $tool_selector -lt 1 || $tool_selector -gt 2 ]]; then
                echo "INVALID OPTION ENTERED!!"
            else
                get_input=false
            fi
        fi
    done

    # If statement to perform actions based on input provided
    if [ "$tool_selector" -eq 1 ]; then
        zip -j "$HOME"/preferences.plist.zip /Library/Preferences/SystemConfiguration/preferences.plist
        clear
        echo "The preferences.plist file has successfully been backed up to a zip folder located in the current users home directory."
    elif [ "$tool_selector" -eq 2 ]; then
        sudo unzip -o "$HOME"/preferences.plist.zip -d /Library/Preferences/SystemConfiguration/
        clear
        echo "The preferences.plist file has successfully been restored from the backed up zip folder."
    fi
    echo ""
    read -rp "Press ENTER to return to Main Menu..."

done
