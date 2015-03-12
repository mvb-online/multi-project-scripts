@echo off
echo ------------------------------------------------------------------------
echo Create Git Repository
echo ------------------------------------------------------------------------
git init 
git remote add origin ssh://%USERNAME%@pm.dev.booklan.de/var/git/repos/%CD%.git
