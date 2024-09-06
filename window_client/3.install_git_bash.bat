@echo off
setlocal

rem Git Bash 설치 파일 URL 설정
set GIT_BASH_URL=https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe

rem 다운로드할 경로 설정
set DOWNLOAD_PATH=%TEMP%\Git-2.42.0-64-bit.exe

rem Git Bash 설치 경로 설정 (기본 설치 경로: C:\Program Files\Git)
set INSTALL_PATH="C:\Program Files\Git"

rem Git Bash 설치 여부 확인
if exist "%INSTALL_PATH%\bin\bash.exe" (
    echo Git Bash is already installed at %INSTALL_PATH%.
    pause
    exit /b 0
)

rem Git Bash 설치 파일 다운로드
echo Downloading Git Bash installer...
bitsadmin /transfer "DownloadGitBash" /priority high %GIT_BASH_URL% %DOWNLOAD_PATH%

rem Git Bash 설치 파일 다운로드 확인
if not exist "%DOWNLOAD_PATH%" (
    echo Failed to download the Git Bash installer.
    pause
    exit /b 1
)

rem Git Bash 설치
echo Installing Git Bash...
start /wait "" "%DOWNLOAD_PATH%" /VERYSILENT /DIR=%INSTALL_PATH%

rem Git Bash 설치 완료 확인
if exist "%INSTALL_PATH%\bin\bash.exe" (
    echo Git Bash has been successfully installed at %INSTALL_PATH%.
) else (
    echo Failed to install Git Bash.
    exit /b 1
)

rem 임시 설치 파일 삭제
del /f /q %DOWNLOAD_PATH%

echo Installation complete.
pause
endlocal


rem GIT_BASH_URL 설정: Git Bash 설치 파일의 다운로드 URL을 설정합니다. 이 예시는 최신 버전 Git Bash(64비트)의 URL을 포함하고 있지만, 필요에 따라 다른 버전을 사용할 수 있습니다.

rem DOWNLOAD_PATH 설정: Git Bash 설치 프로그램을 다운로드할 임시 경로를 설정합니다. 기본적으로 %TEMP% 경로에 다운로드됩니다.

rem INSTALL_PATH 설정: Git Bash가 설치될 경로를 설정합니다. 기본 경로는 C:\Program Files\Git입니다.

rem Git Bash 설치 여부 확인: Git Bash가 이미 설치되어 있는지 확인합니다. 설치되어 있으면 작업을 종료하고, 설치되지 않았으면 계속 진행합니다.

rem bitsadmin으로 Git Bash 다운로드: bitsadmin 명령어를 사용해 설치 파일을 다운로드합니다. 이 명령어는 Windows에서 파일 다운로드를 지원하는 도구입니다.

rem Git Bash 설치: 다운로드한 설치 파일을 /VERYSILENT 옵션을 사용하여 설치합니다. 이 옵션은 설치 중 사용자 입력을 요구하지 않고, 조용히 설치를 진행합니다.

rem 설치 확인 및 완료: Git Bash가 설치되었는지 확인하고, 설치 파일을 삭제한 후 완료 메시지를 표시합니다.