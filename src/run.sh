#!/bin/bash
latex zju-thesis.ins
cp zju-thesis.cls ../demo
make clean -C ../demo
make -C ../demo
rm zju-thesis.cls zju-thesis.sty