#!/usr/bin/env bash
set -euo pipefail

mkdir -p 050_tex_to_pdf
cd 050_tex_to_pdf

echo $(pwd)
cp ../040_docbook_to_tex/$FILENAME"_with_RCJ_preamble.tex" $FILENAME.tex
cp $RULES_DIR/common/stylesheets/manual.sty .

texliveonfly $FILENAME.tex
pdflatex $FILENAME.tex
pdflatex $FILENAME.tex