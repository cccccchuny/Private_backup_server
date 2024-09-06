@echo off
setlocal

rem Git ?? ?? URL ??
set GIT_INSTALLER_URL=https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe

rem ????? ?? ??
set DOWNLOAD_PATH=%TEMP%\Git-2.42.0-64-bit.exe

rem Git ?? ?? ?? (?? ?? ??: C:\Program Files\Git)
set INSTALL_PATH="C:\Program Files\Git"

rem Git ?? ?? ??
if exist "%INSTALL_PATH%\bin\git.exe" (
    echo Git is already installed at %INSTALL_PATH%.
    pause
    exit /b 0
)

rem Git ?? ?? ????
echo Downloading Git installer...
bitsadmin /transfer "DownloadGitInstaller" /priority high %GIT_INSTALLER_URL% %DOWNLOAD_PATH%

rem Git ?? ?? ???? ??
if not exist "%DOWNLOAD_PATH%" (
    echo Failed to download the Git installer.
    pause
    exit /b 1
)

rem Git ??
echo Installing Git...
start /wait "" "%DOWNLOAD_PATH%" /VERYSILENT /NORESTART /DIR=%INSTALL_PATH%

rem Git ?? ?? ??
if exist "%INSTALL_PATH%\bin\git.exe" (
    echo Git has been successfully installed at %INSTALL_PATH%.
) else (
    echo Failed to install Git.
    exit /b 1
)

rem ?? ?? ?? ??
del /f /q %DOWNLOAD_PATH%

echo Installation complete.
pause
endlocal