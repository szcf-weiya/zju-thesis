#!/bin/bash
rm -f zju-thesis.cls
latex zju-thesis.ins
xelatex zju-thesis.dtx
xelatex zju-thesis.dtx
cp zju-thesis.cls ../demo
make clean -C ../demo
make -C ../demo
make clean -C ../demo
rm -f zju-thesis.cls zju-thesis.sty *.log *.aux *.synctex.gz *.toc *.bbl *.bcf *.blg *.out *.xml *.idx *.dvi *.glo *.hd