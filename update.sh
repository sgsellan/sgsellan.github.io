#!/bin/bash
# First, navigate to /static/cv/
cd static/pdf/cv/
# write tex data
python write_tex_data.py
# compile tex to pdf
pdflatex cv.tex
# a few times
pdflatex cv.tex
pdflatex cv.tex
# go back to root dir
cd ../../../
# call hugo
hugo
# commit and push
git add --all
git commit -m "update"
git push