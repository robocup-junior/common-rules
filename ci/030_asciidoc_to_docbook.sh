#!/usr/bin/env bash
set -euo pipefail

mkdir -p 030_asciidoc_to_docbook
cd 030_asciidoc_to_docbook

asciidoctor -b docbook ../020_criticmarkup/$FILENAME_WITH_EXT -o $FILENAME.xml
