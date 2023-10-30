#!/bin/bash
# First, navigate to /static/cv/
cd static/pdf/cv/
# write tex data
python write_tex_data.py
# compile tex to pdf
pdflatex cv.tex
# go back to root dir
cd ../../../
# call hugo
hugo
cd themes/anatole/
git add --all
git commit --all -m "update"
git push
cd ../..
# commit and push
git add --all
git commit --all -m "update"
git push