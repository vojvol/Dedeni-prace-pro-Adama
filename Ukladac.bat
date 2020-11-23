@echo off
cls
rem Made by Vojtech Voldrich
echo Jak chcete pojmenovat zmenu?
set/p "change="
title ukladam
git add .
git commit -m "%change%"
git push -u origin master
title ulozeno
pause