#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

set -euo pipefail

cd "${GITHUB_WORKSPACE}"

IFS=$'\n'
if [ -n "${1:-}" ]; then
  for arg in $1; do
    args+=("${arg}")
  done
fi

if [ -n "${2:-}" ]; then
  for sup in $2; do
    suppress+=("--suppress=${sup}")
  done
fi

IFS=' '
xslint "${args[@]}" "${suppress[@]}"
