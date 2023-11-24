#!/usr/bin/env bash
set -euo pipefail

mkdir -p 020_criticmarkup
cd 020_criticmarkup

# This adds 
python3 $RULES_DIR"/common/ci/020_criticmarkup_to_adoc.py" ../../tmp/010_assemble_templates_and_blocks/$FILENAME_WITH_EXT > $FILENAME_WITH_EXT
