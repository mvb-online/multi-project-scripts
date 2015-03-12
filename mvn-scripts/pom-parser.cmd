set BATCHDIR=%1
set XSLT_DIR=%BATCHDIR%mvn-scripts\xslt
set XSLT_DIR=%XSLT_DIR:C:=%
set XSLT_DIR=%XSLT_DIR:\=/%

java -classpath %XSLT_DIR%/saxon9he.jar net.sf.saxon.Transform -s:pom.xml -xsl:%XSLT_DIR%/%2.xslt
