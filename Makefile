# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

.SHELLFLAGS := -e -o pipefail -c
.ONESHELL:
SHELL := bash
.PHONY: all test clean

all: test

test:
	docker build . -t xslint-action
	output=$$(docker run --rm -v "$$(pwd):/w" -e HOME -e GITHUB_WORKSPACE='.' xslint-action $$'xsl-packs/xsl-with-no-violations.xsl\nxsl-packs/xsl-with-some-violations.xsl' $$'empty-content-in-instruction\ntemplate-match-starts-with-double-slash' 2>&1 || true)
	for expected in \
		"Processed files: 2" \
		"Defects found: 4" \
		"Directories and files to process: xsl-packs/xsl-with-no-violations.xsl, xsl-packs/xsl-with-some-violations.xsl"; \
	do \
		echo "$$output" | grep -q "$$expected" || (echo "Expected, but not found '$$expected'" && exit 1;) \
	done
	for absent in \
		"empty-content-in-instruction" \
        "template-match-starts-with-double-slash"; \
    do \
      	echo "$$output" | grep -q "$$absent" && (echo "Unexpected, but found '$$absent'" && exit 1;) \
    done
	docker rmi xslint-action
