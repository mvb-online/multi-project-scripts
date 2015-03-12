@echo off
set BATCHDIR=%~dp0

for /d %%i in (*) do (
	echo ------------------------------------------------------------------------
	echo Working in project: %%i
	echo ------------------------------------------------------------------------
	pushd %%i
	call %BATCHDIR%\project-scripts\%%1.cmd
	popd
)
