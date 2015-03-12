for /f "delims=" %%a in ('git describe --tags --abbrev^=0') do @set latesttag=%%a
git log %latesttag%..HEAD --oneline