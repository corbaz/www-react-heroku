cls
git rm -r --cached node_modules
git remote add origin %github_repo%

git add .
git commit -am "Main: Final con todas las branches"
git push -u origin --all --force