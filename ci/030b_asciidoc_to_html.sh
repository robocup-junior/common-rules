#!/usr/bin/env bash
set -euo pipefail

mkdir -p 030b_asciidoc_to_html
cd 030b_asciidoc_to_html

asciidoctor ../020_criticmarkup/$FILENAME_WITH_EXT -o $FILENAME.html
