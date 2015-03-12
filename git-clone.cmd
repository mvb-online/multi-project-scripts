@echo off
set BATCHDIR=%~dp0

REM This script is very special, in that it handles the cloning of all git-repos
REM given in the git-scripts/git-repos.txt
REM This is to make it easy to initialize the project-structure for further
REM usage on a windows machine

set ARG1=%1
for /F "tokens=*" %%A in  ( %BATCHDIR%/git-scripts/config/git-repos.txt ) do  (
  ECHO Processing %%A.... 
  CALL %BATCHDIR%/git-scripts/clone-exec.cmd %%A
)
@echo on
