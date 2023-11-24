#!/usr/bin/env bash
set -euo pipefail

export FILENAME=$(basename -s .adoc $1)
export FILENAME_WITH_EXT=$1
export RULES_DIR=$(pwd)

rm -rf build/
mkdir -p build/results
mkdir -p build/tmp
cd build/tmp

# assemble icons, media etc. in order of common first, then overwrite with
# files with same name from corresponding user repositories
mkdir media
cp -r $RULES_DIR/common/assets/icons media/
# centralized media does not exist yet - suppressing error
cp -r $RULES_DIR/common/assets/media/ media/ 2> /dev/null || true
# media and icons-directories are optional for rules repos - suppressing errors
cp -r $RULES_DIR/media media/ 2> /dev/null || true
cp -r $RULES_DIR/icons media/ 2> /dev/null || true

$RULES_DIR"/common/ci/010_assemble_templates_and_blocks.sh"

$RULES_DIR"/common/ci/020_criticmarkup.sh"

$RULES_DIR"/common/ci/030_asciidoc_to_docbook.sh"

# assemble HTML-rules and corresponding assets (i.e. loaded in media files etc.)
mkdir -p ../results/$FILENAME"_html/"
cp -r media/* ../results/$FILENAME"_html/" 2> /dev/null || true

$RULES_DIR"/common/ci/030b_asciidoc_to_html.sh"
cp 030b_asciidoc_to_html/$FILENAME.html $RULES_DIR/build/results/$FILENAME"_html/"