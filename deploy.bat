set comment=%1
git add .
git status
git commit -m %comment%
git push