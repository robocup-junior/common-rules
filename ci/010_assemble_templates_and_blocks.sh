#!/usr/bin/env bash
set -euo pipefail

# install jinja2 CLI tool to render jinja2 template language
apk add py3-pip
pip install j2cli > /dev/null

mkdir -p 010_assemble_templates_and_blocks
cd 010_assemble_templates_and_blocks

j2 $RULES_DIR/$FILENAME_WITH_EXT -o $FILENAME_WITH_EXT