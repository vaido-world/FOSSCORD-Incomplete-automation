# FOSSCORD-Incomplete-automation
NodeJS unable to find Visual Studio outside the usual /Program Files/ folder 

First run `setup.cmd`, it will download:
* git portable version
* NodeJS portable version
* Python portable version

Secondly it will clone the source code from the FOSSCORD repository
using the portable git version.

And then start a setup of the project using NodeJS.


To start the project after the Setup, simply double click the `start.cmd` script

Visual Studio does not seem to work outside the `/ProgramFiles/` Folder


The project uses `curl`, `tar` and other recent native additions to Windows Operating System.  
(To download and extract things)
