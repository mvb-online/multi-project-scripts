@echo off
set BATCHDIR=%~dp0

for /d %%i in (*) do (
	if exist %%i\.git (
		echo ------------------------------------------------------------------------
		echo Working in git-project: %%i
		echo ------------------------------------------------------------------------
		pushd %%i
		call %BATCHDIR%\git-scripts\%%1.cmd %%i %1
		popd
	)
)
