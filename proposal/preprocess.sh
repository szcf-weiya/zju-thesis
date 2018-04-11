#!/bin/bash

# #########################################
# remove the first page
# #########################################
#pdftk gls-original.pdf cat 2-18 output gls-original-2.pdf

# #######################################################
# convert multiple decoders to single decoder
# 
# refer to 
# https://tex.stackexchange.com/questions/106964/could-not-insert-pdf-graphics 
# for more details
# #######################################################
pdftops gls-original-2.pdf
epstopdf gls-original-2.ps 