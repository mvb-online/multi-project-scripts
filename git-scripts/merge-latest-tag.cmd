call git checkout master
for /f "delims=" %%a in ('git describe --tags --abbrev^=0') do @set latesttag=%%a

echo Merging %latesttag%

call git checkout devel
call git merge %latesttag%
call git checkout master
