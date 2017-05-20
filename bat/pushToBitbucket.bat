@echo off

set path=%path%;C:/Program Files (x86)/Git/bin

echo "This script will push mutiple projects to Bitbucket automatically."

echo "Please input the path: "

set /p dir=

for /f "delims=," %%j in (%dir%\filelist.txt) do (
cd %dir%\%%j

git init 
git config http.sslVerify false
rem git pull origin master
git add --all
git commit -m "Push the codes to Bitbucket"
git remote add origin git@github.com:delevinzhong/%%j.git
git push origin master
)
cd %dir%
