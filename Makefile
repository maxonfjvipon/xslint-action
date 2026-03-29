# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

.SHELLFLAGS := -e -o pipefail -c
.ONESHELL:
SHELL := bash
.PHONY: all clean test

all: test

test:
	docker build . -t xslint-action
	docker run --rm -v "$$(pwd):/w" -e HOME -e GITHUB_WORKSPACE='.' xslint-action $$'xsl-packs/xsl-with-no-violations.xsl\nxsl-packs/xsl-with-some-violations.xsl' $$'empty-content-in-instruction\ntemplate-match-starts-with-double-slash'
	docker rmi xslint-action
