@ECHO OFF

:: Open webpage with Web client of FOSSCORD
START /MIN "" "open_browser_url_delayed.cmd"


:: Clear PATH variable to use only Portable version of programs.
SET "PATH="

REM    SET "THREADS=8"
REM    Amount of threads/workers to use

REM   SET "DATABASE=db://username:password@db/dbname"
REM   Connection URL of the database

REM https://docs.fosscord.com/server/env/#example



:: Add git Portable git
SET "PATH=%PATH%;%~DP0\MinGit-2.36.1-64-bit\cmd\"

:: Start the FOSSCORD SERVER using NodeJS
SET "HTTP_PORT=3009"	
SET "PATH=%PATH%;%~DP0\node-v16.15.1-win-x64\"
CD ".\fosscord-server-master\bundle"
CALL "..\..\node-v16.15.1-win-x64\npm.cmd" run start:bundle


PAUSE