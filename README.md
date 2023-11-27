# preferences-plist-br

Description: Backups and restores the preferences.plist file located at "/Library/Preferences/SystemConfiguration/preferences.plist".
              The preferences.plist file is backed up to a zip folder in the users home directory.
              THE SCRIPT NEEDS TO BE RAN WITH ADMIN PRIVILEGES TO RESTORE FILE!

Usage: sh <path_to_script> | sudo sh <path_to_script> | su -m <admin_user> -c <path_to_script>

Examples: sh preferences_plist_backup_restore.sh | sudo preferences_plist_backup_restore | su -m admin preferences_plist_backup_restore.sh
