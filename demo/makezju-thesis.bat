@echo off
echo Welcome to use the zju-thesis template by weiya.
xelatex main
biber main
xelatex main
xelatex main
del /s *.aux
del /s *.bbl
del /s *.bcf 
del /s *.blg
del /s *.log
del /s *.xml
del /s *.toc
del /s *.synctex.gz
del /s *.out
del /s *.ptc