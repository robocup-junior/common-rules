#!/usr/bin/env bash
set -euo pipefail

BASE_DIR=$(git rev-parse --show-toplevel)
if [ $BASE_DIR = "common" ]; then
    BASE_DIR = dirname $BASE_DIR
fi

echo $BASE_DIR

docker run --rm -v $BASE_DIR:/documents asciidoctor/docker-asciidoctor ./common/ci/001b_build_rules_docs.sh $1

docker run --rm -v $BASE_DIR:/documents mrshu/texlive-dblatex ./common/ci/001c_build_rules_tex_pdf.sh $1

rm -r build/tmp