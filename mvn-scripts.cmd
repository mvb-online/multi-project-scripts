@echo off
set BATCHDIR=%~dp0

REM remove existing dep.txt file
del dep.txt

for /d %%i in (*) do (
	if exist %%i\pom.xml (
		echo ------------------------------------------------------------------------
		echo Working in mvn-project: %%i
		echo ------------------------------------------------------------------------
		pushd %%i
		call %BATCHDIR%\mvn-scripts\%%1.cmd %BATCHDIR%
		popd
	)
)
