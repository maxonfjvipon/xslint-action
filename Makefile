# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

.SHELLFLAGS := -e -o pipefail -c
.ONESHELL:
SHELL := bash
.PHONY: all clean test

all: test

test:
	@docker build . -t xslint-action
	@output=$$(docker run --rm -v "$$(pwd):/w" -e HOME -e GITHUB_WORKSPACE='.' xslint-action $$'xsl-packs/xsl-with-no-violations.xsl\nxsl-packs/xsl-with-some-violations.xsl' $$'empty-content-in-instruction\ntemplate-match-starts-with-double-slash');
	echo "$$output" | grep -q "Processed files: 2" || exit 1; echo "$$output" | grep -q "Defects found: 4" || exit 1; echo "$$output" | grep -q "Directories and files to process: xsl-packs/xsl-with-no-violations.xsl, xsl-packs/xsl-with-some-violations.xsl" || exit 1;\
 	echo "$$output" | grep -q "empty-content-in-instruction" && exit 1; echo "$$output" | grep -q "template-match-starts-with-double-slash" && exit 1;\
	@docker rmi xslint-action
