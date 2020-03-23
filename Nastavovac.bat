cls
@echo on
echo SNEKtech
echo Prosim vlozte URL adresu stranky
echo Napriklad
echo https://github.com/vojvol(jmeno vaseho uctu)/test.gift (jmeno repozitare)
set/p "url="
git init
type nul > readme.md
git add .
git commit -m "initialization"
git commit -m "initialization2"
git remote add origin %url%
git push -u origin master
pause
