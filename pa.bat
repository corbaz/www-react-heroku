cls
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