#!/usr/bin/env bash
set -euo pipefail

export FILENAME=$(basename -s .adoc $1)
export FILENAME_WITH_EXT=$1
export RULES_DIR=$(pwd)

mkdir -p build/results
mkdir -p build/tmp
cd build/tmp

$RULES_DIR"/common/ci/040_docbook_to_tex.sh"
# assemble assets so they can be rendered into the PDF
mkdir -p 050_tex_to_pdf
cp -r media/media ./050_tex_to_pdf/ 2> /dev/null || true
cp -r media/icons ./050_tex_to_pdf/
$RULES_DIR"/common/ci/050_tex_to_pdf.sh"
mv 050_tex_to_pdf/$FILENAME.pdf ../results/