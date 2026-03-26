#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
# SPDX-License-Identifier: MIT

set -euo pipefail

dir=$1

cd "${GITHUB_WORKSPACE}"

xslint "${dir}"
