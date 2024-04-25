.ONESHELL:
.PHONY: build

all:
	cd ./src/
	latexmk -pdf -xelatex -interaction=nonstopmode cv.tex
	cd ..
	convert ./src/cv.pdf[0] -resize 800x800 -flatten cv_thumbnail.png
	convert cv_thumbnail.png -shave 1x1 -bordercolor black -border 1 cv_thumbnail.png
	convert cv_thumbnail.png -bordercolor None -border 20x20 \( +clone -background black -shadow 50x5+5+5 \) -compose DstOver -composite -compose Over cv_thumbnail.png

build:
	cd ./src/
	latexmk -pdf -xelatex -interaction=nonstopmode cv.tex
# 	latexmk --pdf -pdflatex="xelatex --shell-escape" letter-ea.tex

build-cont:
	cd ./src/
	latexmk -pvc -pdf -xelatex -interaction=nonstopmode cv.tex
