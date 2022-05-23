cls
@echo off

echo git branch - Lista todas las ramas del repositorio.
git branch
echo.

echo git branch -a - Lista todas las ramas del repositorio, incluyendo las remotas.
git branch -a
echo.

echo Crea una nueva rama local.
echo git checkout -b new-branch
echo.

echo Raname branch
echo git branch -m new-branch-name
echo.

echo Cambiar de rama
echo git checkout branch-name

echo Borrar una rama
echo git branch -D branch-name