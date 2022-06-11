@ECHO OFF & TITLE FOSSCORD MASTER SERVER SETUP and Runtime Environment
ECHO 0. Project preparation "%~DP0"
ECHO 1. Downloading and Extracting NodeJS Portable Platform
IF NOT EXIST ".\node-v16.15.1-win-x64\" (
	curl "https://nodejs.org/dist/v16.15.1/node-v16.15.1-win-x64.zip" -O
	tar -xzvf "./node-v16.15.1-win-x64.zip"
	DEL "./node-v16.15.1-win-x64.zip"
) ELSE (
	ECHO  NodeJS ".\node-v16.15.1-win-x64\" folder already exists.
	ECHO  Canceling Download.
)

ECHO 2. Downloading and and Extracting Python3 Portable Platform
IF NOT EXIST ".\python-3.10.5-embed-amd64\" (
	curl https://www.python.org/ftp/python/3.10.5/python-3.10.5-embed-amd64.zip -O
	MKDIR python-3.10.5-embed-amd64
	tar -xzvf "./python-3.10.5-embed-amd64.zip" -C .\python-3.10.5-embed-amd64\
	DEL "./python-3.10.5-embed-amd64.zip"
) ELSE (
	ECHO  Python3 ".\python-3.10.5-embed-amd64\" folder already exists.
	ECHO  Canceling Download.
)

ECHO 3. Cloning Fosscord Repository from GitHub (Downloading FOSSCORD Source Code)
ECHO Download Additional tools utilized by FOSSCORD Source Code.
ECHO   Installing git official tool Portable version.

IF NOT EXIST ".\MinGit-2.36.1-64-bit\" (
	curl -L https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/MinGit-2.36.1-64-bit.zip -O
	MKDIR MinGit-2.36.1-64-bit
	tar -xzvf "./MinGit-2.36.1-64-bit.zip" -C .\MinGit-2.36.1-64-bit\
	DEL "./MinGit-2.36.1-64-bit.zip"
) ELSE (
	ECHO  Git ".\MinGit-2.36.1-64-bit\" folder already exists.
	ECHO  Canceling Download.
)

:: Add git Portable git
SET "PATH=%PATH%;%~DP0\MinGit-2.36.1-64-bit\cmd\"


IF NOT EXIST ".\fosscord-server-master\" (
	%~DP0\MinGit-2.36.1-64-bit\cmd\git.exe clone "https://github.com/fosscord/fosscord-server" 
	ren "%~DP0fosscord-server" "fosscord-server-master"
)

ECHO 4. NodeJS NPM install packages and overall setup of Python and Visual Studio
ECHO  Fetching and Installing Node Modules into (.\fosscord-server-master\bundle\node_modules)

SET "PATH="
:: Resolve VC https://github.com/nodejs/node-gyp/issues/2552#issuecomment-974861304


:: Add git Portable git
SET "PATH=%PATH%;%~DP0\MinGit-2.36.1-64-bit\cmd\"

:: PYTHON Environment
SET "PYTHON=%~DP0python-3.10.5-embed-amd64\python.exe"

:: Can be removed 
SET "PATH=%PATH%;%~DP0python-3.10.5-embed-amd64\"

:: NODEJS Environment
SET PATH=%PATH%;%~DP0\node-v16.15.1-win-x64\
ECHO.
ECHO %PATH%

REM C:\Users\Windows10\Desktop\self-host-discord\scritped_selfhost\start_again\Microsoft Visual Studio\2022\Community\VC\Tools

:: Visual Studio Community for NodeJS


@SET "Current=%~DP0"

SET msbuild_path = "C:\Program Files\Microsoft Visual Studio\2022\Community\Msbuild\Current\Bin\MSBuild.exe"

:: DOES NOT WORK from a different folder 
@SET "msvs_version=2022" 
@SET "VCINSTALLDIR=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\"

:: Useless stuff.
@SET "VSINSTALLDIR=C:\Program Files\Microsoft Visual Studio\2022\Community\"
@SET "VCIDEInstallDir=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\VC\"
@SET "VCToolsInstallDir=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.30.30705\"
@SET "VCToolsRedistDir=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Redist\MSVC\14.30.30704\"
@SET "VCToolsVersion=14.30.30705"
@SET "VisualStudioEdition=Microsoft Visual Studio Community 2022"
@SET "VisualStudioVersion=17.0"
@SET "VS170COMNTOOLS=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\"
@SET "VSCMD_VER=17.0.1"
@SET "VSLANG=1033"
@SET "VSSDK150INSTALL=C:\Program Files\Microsoft Visual Studio\2022\Community\VSSDK"
@SET "VSSDKINSTALL=C:\Program Files\Microsoft Visual Studio\2022\Community\VSSDK"
@SET "VSSKUEDITION=Community"


echo.
REM CALL node-v16.15.1-win-x64\npm.cmd config ls -l


CD ".\fosscord-server-master\bundle"

REM THERE IS NO LONGER A NEED FOR BUILDTOOLS  in NODEJS, it can do it itself.
REM CALL ..\..\node-v16.15.1-win-x64\npm.cmd install --global --production windows-build-tools

CALL ..\..\node-v16.15.1-win-x64\npm.cmd config set VCINSTALLDIR "%~DP0Microsoft Visual Studio\2022\Community\VC\"
CALL ..\..\node-v16.15.1-win-x64\npm.cmd config set msvs_version 2022
CALL ..\..\node-v16.15.1-win-x64\npm.cmd run setup

PAUSE





EXIT 
GOTO :tttt
:tttt

:: Unused blocks of code. [CAN BE DELETED] ---- START


:: Check for Python Installation
python --version 3>NUL
if errorlevel 1 goto errorNoPython


IF EXIST ".\node-v16.15.1-win-x64\node.exe" ECHO  ".\node-v16.15.1-win-x64\node.exe" detected.

CALL :CheckBinarySize ".\node-v16.15.1-win-x64\node.exe"
:CheckBinarySize
ECHO The size of node.exe binary is %~z1
IF %~z1 equ 61295224 (
	ECHO  %1 Is not damaged due to its size being exactly 61295224 Bytes 
	ECHO  (size of v16.15.1 version, node.exe, binary)
)
GOTO :EOF

:: Unused blocks of code. [CAN BE DELETED] -^ END


REM curl https://www.python.org/ftp/python/3.10.5/python-3.10.5-embed-amd64.zip -O
REM tar 



