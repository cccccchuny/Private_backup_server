@echo off
rem ?? ?? ??
set TASK_NAME=MyBackupTask

rem ?? ?????? ?? ??
echo Deleting scheduled task '%TASK_NAME%'...
schtasks /delete /tn %TASK_NAME% /f

echo Task '%TASK_NAME%' has been successfully deleted.
pause
