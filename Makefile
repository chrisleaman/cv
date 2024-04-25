.ONESHELL:
.PHONY: build

build:
	cd ./src/
	latexmk -pdf -xelatex -interaction=nonstopmode cv.tex
# 	latexmk --pdf -pdflatex="xelatex --shell-escape" letter-ea.tex

build-cont:
	cd ./src/
	latexmk -pvc -pdf -xelatex -interaction=nonstopmode cv.tex
