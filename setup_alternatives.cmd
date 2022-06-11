@ECHO OFF
ECHO There is no reason to launch this batch file.
ECHO This is only a collection of well working but removed stuff.

PAUSE
EXIT



REM            USAGE: CALL :CURL_METHOD_DOWNLOAD_SOURCE_CODE_WINDOWS_10_FROM_GITHUB

:CURL_METHOD_DOWNLOAD_SOURCE_CODE_WINDOWS_10_FROM_GITHUB
ECHO 3. Downloading and Extracting Fosscord Source Code from GitHub
IF NOT EXIST ".\fosscord-server-master\" (
	curl -L "https://github.com/fosscord/fosscord-server/archive/refs/heads/master.zip" -O
	tar -xzvf "master.zip"
	DEL "./master.zip"
) ELSE (
	ECHO  Fosscord ".\fosscord-server-master\" folder already exists.
	ECHO  Canceling Download.
)
GOTO :EOF
PAUSE