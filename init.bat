@echo off
@REM set dir_raiz=%~dp0
@REM Defino dir raiz y bat

SET proyecto=www-react-heroku
SET %github%_user=corbaz
SET %heroku%_user=julio.corbaz@gmail.com

set %github%_web=https://github.com/
set %github%_profile=%github_web%%github_user%/
set %github%_repo=%github_profile%%proyecto%.git

set %heroku%_apps=https://dashboard.heroku.com/apps/
set %heroku%_dashboard=%heroku_apps%%proyecto%
set %heroku%_web=https://git.heroku.com/
set %heroku%_repo=%herooku_webe%%proyecto%.git

set bat=bat
set git=git
set github=github
set heroku=heroku

set dir_raiz=%cd%
set dir_%bat%=%dir_raiz%\%bat%
set dir_%bat%_%git%=%dir_raiz%\%bat%\%git%
set dir_%bat%_%github%=%dir_raiz%\%bat%\%github%
set dir_%bat%_%heroku%=%dir_raiz%\%bat%\%heroku%
@REM agrego al PATH los directorios raiz y bat
set PATH=%PATH%;%dir_raiz%;%dir_bat%;%dir_bat_git%;%dir_bat_github%;%dir_bat_heroku%

SET pages_github=https://%github_user%.github.io/%proyecto%/
SET pages_heroku=https://%proyecto%.herokuapp.com/

SET rama_main=main
SET rama_dev=dev
SET rama_github=github
SET rama_heroku=heroku

@REM call npm create vite@latest %repo_name% -- --template react
@REM /S	Copia directorios y subdirectorios, excepto los vacíos.
@REM /E	Copia directorios y subdirectorios, incluidos los vacíos.
git init 
git add .
git commit -m "Inicio main"
git push
pause push

@REM git checkout -b %rama_dev%
call git checkout %rama_dev%
call rd * /s /q
pause
git checkout main www/
git checkout main bat/
git branch -v
pause
git add .
git commit -m "Inicio dev"
git checkout %rama_main%
pause





