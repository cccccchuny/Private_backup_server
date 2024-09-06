@echo off
rem ?? ???? ?? ??
set BATCH_FILE_PATH=C:\path\to\your\backup.bat

rem ?? ?? ??
set TASK_NAME=MyBackupTask

rem ?? ?? (?? ?? 1?)
set SCHEDULE_TIME=01:00

rem ?? ????? ?? ??
echo Creating a scheduled task for the backup...
schtasks /create /tn %TASK_NAME% /tr "%BATCH_FILE_PATH%" /sc daily /st %SCHEDULE_TIME%

echo Task '%TASK_NAME%' has been successfully created to run daily at %SCHEDULE_TIME%.
pause



rem BATCH_FILE_PATH ??: ?? ?? ??? ??? ?????. ? ??? ??? ??? ?? ?? ??(backup.bat)? ??? ???? ???.

rem TASK_NAME ??: ?? ????? ??? ??? ??? ?????. ?? ?????? ? ??? ?? ??? ??? ? ????.

rem SCHEDULE_TIME ??: ??? ??? ??? ?????. ????? ?? ?? 1?? ???? ????. ??? ??? ?? ??? ? ????.

rem schtasks ???? ?? ??: schtasks ??? ???? ??? ??? ?? ?? ??? ????? ??? ????. /sc daily? ?? ????? ???? ????, /st? ??? ???? ?????.

rem ?? ?? ???: ?? ??? ???? ?? ???? ?????.