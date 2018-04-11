#!/bin/bash
latex zju-thesis.ins
cp zju-thesis.cls ../demo
make clean -C ../demo
make -C ../demo
make clean -C ../demo
rm -f zju-thesis.cls zju-thesis.sty *.log *.aux *.synctex.gz *.toc *.bbl *.bcf *.blg *.out *.xml *.idx *.dvi *.glo *.hd