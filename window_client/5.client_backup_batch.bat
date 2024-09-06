@echo off
rem ??? ?? ?? ??
set SOURCE_FOLDER=C:\Users\ccccc\OneDrive\?? ??\VSCode_src\backup_windows_data_to_linux_server\Private_backup_server\window_client
rem Linux ?? ???? ? IP ??
set LINUX_USER=ned
set LINUX_SERVER=121.134.174.145
rem ??? ??
set DEST_FOLDER=/home/ned/ned/nfs_share/ned_private_repo

rem rsync? ???? ?? ??
rsync -avz --delete %SOURCE_FOLDER% %LINUX_USER%@%LINUX_SERVER%:%DEST_FOLDER%
