@echo off
set BATCHDIR=%~dp0

cd %2
call %BATCHDIR%\git-scripts\%%1.cmd
cd ..