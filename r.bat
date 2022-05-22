@echo off
cls
SET user_name=corbaz
SET user_http=https://github.com/%user_name%/
SET repo_name=www-react-heroku
SET repo_http_github=%user_http%%repo_name%.git
SET repo_http_heroku=https://git.heroku.com/%repo_name%.git
SET web_github=https://%user_name%.github.io/%repo_name%/
SET web_heroku=https://jcc-react.herokuapp.com/
SET rama_principal=main
SET rama_github=github
SET rama_heroku=heroku

@REM call npm create vite@latest %repo_name% -- --template react
@REM /S	Copia directorios y subdirectorios, excepto los vacíos.
@REM /E	Copia directorios y subdirectorios, incluidos los vacíos.
git checkout -b %rama_github%
git checkout dev /dist
call rd * /s /q
pause

xcopy www %repo_name% /E
cd %repo_name%

git init
call npm install

@REM Login en Github
call gh auth login

@REM Crear Repo en Github
call gh repo create %repo_name% --public --clone

@REM Generar vite.config.js para la compilacion Github Github Pages
call ../www/vite/github/vite.config.js.bat %repo_name%

@REM ejecutamos publish 
@REM que ejeuta buils deonde cargamos modulos node 
@REM genera la carpeta /dist con vite build 
@REM con la configugacion vite.config.js
@REM con gh-pages publicamos en github en la rama gh-pages
call npm run publish

@REM Generamos README.md
echo ### USUARIO: %user_name% > README.md
echo #### NOMBRE DEL REPOSITORIO:  %repo_name% >> README.md
echo #### LINK DEL REPOSITORIO: %repo_http_github%>> README.md

@REM convertimos a la rama en main
git checkout -b %rama_github%
@REM Agregamos los cambios al stage
git add .
@REM Hacemos un commit
git commit -m "%rama_github%: %repo_name% Inicio"


@REM git remote set-url origin %repo_http_github%
@REM Adicionamos el repositorio remoto
git remote add origin %repo_http_github%
@REM Hacemos un push y subimos los cambios
git push -u origin %rama_principal% --force

@REM ******
@REM HEROKU
@REM ******

call heroku login
git checkout -b %rama_heroku%
git init

call heroku create %repo_name%
call heroku buildpacks:set heroku/nodejs
call heroku git:remote -a %repo_name%
call heroku config:set HOST=0.0.0.0
call heroku config:set NPM_CONFIG_PRODUCTION=false
call heroku config:set MODE_ENV=production

@REM Compio la configuracion de vite para Heroku
xcopy ..\www\vite\heroku\vite.config.js .

@REM Borro la carpeta dist q era para Github Page
@REM rd public /s /q 
call rd dist /s /q

git rm -r --cached node_modules
git add .
git commit -m "%rama_principal%: %repo_name% Inicio"

@REM git push heroku heroku:main 
git push -u %rama_heroku% %rama_heroku%:%rama_principal% --force


git checkout %rama_principal%
cd ..
call rd %repo_name% /s /q

git remote add origin %repo_http_github%
call heroku git:remote -a %repo_name%

git remote -v
call heroku open
call start chrome.exe %web_github%