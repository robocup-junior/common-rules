#!/usr/bin/env bash
set -euo pipefail

mkdir -p 040_docbook_to_tex
cd 040_docbook_to_tex

# Apply custom styling to DocBook
dblatex -T db2latex ../030_asciidoc_to_docbook/$FILENAME.xml -t tex --texstyle=$RULES_DIR"/common/stylesheets/manual.sty" -p $RULES_DIR"/common/stylesheets/custom.xsl" -o $FILENAME.tex

# Go through the generated .tex output, find the place where the default preamble ends
# (marked by the \mainmatter command) and create a file without it.
cat $FILENAME.tex | awk 'f;/\\mainmatter/{f=1}' > $FILENAME"_without_preamble.tex"
# Concat our RCJ preamble with the "without_preamble" version of the file
cat $RULES_DIR/preamble.tex $FILENAME"_without_preamble.tex" > $FILENAME"_with_RCJ_preamble.tex"