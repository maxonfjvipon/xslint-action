#!/bin/bash

set -euo pipefail

dir=$1

cd ${GITHUB_WORKSPACE}

xslint "${dir}"
