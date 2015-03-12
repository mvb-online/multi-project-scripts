REM dirty, just to retrieve the current folder, to be able to print it on the next level...
REM for %%a in (.) do set currentfolder=%%~na
REM set LEVEL=%currentfolder%

REM call %BATCHDIR%mvn-scripts\pom-parser.cmd %BATCHDIR% list-dependencies
REM display-ancestors not available in used version 2.8, only in version 2.10
REM mvn dependency:display-ancestors -Dincludes=de.mvbonline -B -fn -DoutputFile=%BATCHDIR%\..\dep.txt -DappendOutput=true -DoutputType=text -q
mvn dependency:tree -Dincludes=de.mvbonline -B -fn -DoutputFile=%BATCHDIR%\..\dep.txt -DappendOutput=true -DoutputType=text -q
REM mvn dependency:list -DincludeGroupIds=de.mvbonline -B -fn -DoutputFile=%BATCHDIR%\..\dep.txt -DappendOutput=true -DoutputType=text -Dsort=true -DincludeParents=true -q

REM if defined LEVEL (
REM 	for /d %%i in (*) do (
REM 		if exist %%i\pom.xml (
REM 			echo ------------------------------------------------------------------------
REM 			echo Working in mvn-project: %LEVEL%/%%i
REM 			echo ------------------------------------------------------------------------
REM 			pushd %%i
REM 			call %BATCHDIR%\mvn-scripts\list-dependencies.cmd %BATCHDIR% %LEVEL%
REM 			popd
REM 		)
REM 	)
REM )
