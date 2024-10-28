#!/bin/bash

# Compile document
pdflatex -interaction=nonstopmode main

# Compile nomenclature
makeindex main.nlo -s nomencl.ist -o main.nls

# Compile index
makeindex main

# Compile bibliography
biber main

# Compile document
pdflatex -interaction=nonstopmode main

# Compile glossary
makeglossaries main

# Compile document
pdflatex -interaction=nonstopmode main

# Generate default CSS from pandoc
pandoc -D html > docs/style.css

# Compile document to HTML
pandoc main.tex -s -o docs/index.html --bibliography=main.bib --css=style.css

cp images/*.png docs/  # or specify image directory