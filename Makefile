# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

.SHELLFLAGS := -e -o pipefail -c
.ONESHELL:
SHELL := bash
.PHONY: all test

all: test test1

test:
	docker build . -t xslint-action
	@count=0;\
	output=$$(docker run --rm -v "$$(pwd):/w" -e HOME -e GITHUB_WORKSPACE='.' xslint-action $$'xsl-packs/xsl-with-no-violations.xsl\nxsl-packs/xsl-with-some-violations.xsl' $$'empty-content-in-instruction\ntemplate-match-starts-with-double-slash');\
	echo "$$output" | grep -q "2" ((count++));\
	echo "$$output" | grep -q "4" ((count++));\
	echo "$$count"
	@docker rmi xslint-action

