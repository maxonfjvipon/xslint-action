#!/bin/bash

set -euo pipefail

cd ${GITHUB_WORKSPACE}

arguments=""

for arg in $1
do
  arguments="${arguments} ${arg} "
done

suppress=""

for sup in $2
do
  suppress="${suppress} --suppress=${sup} "
done

xslint "${arguments} ${suppress}"
