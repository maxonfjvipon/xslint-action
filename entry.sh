#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

set -euo pipefail

cd "${GITHUB_WORKSPACE}"

IFS=$'\n'
for arg in $1; do
  args+=("${arg}")
done

for sup in $2; do
  suppress+=("--suppress=${sup}")
done
IFS=' '
xslint "${args[@]}" "${suppress[@]}"
