/*
 * SPDX-FileCopyrightText: Copyright (c) 2026 Max Trunnikov
 * SPDX-License-Identifier: MIT
 */

const {spawnSync} = require('node:child_process')

const lines = (input) => (input || '')
  .split(/\r?\n/)
  .filter((line) => line !== '')

const outcome = spawnSync(
  'npx',
  [
    '--yes',
    '@maxonfjvipon/xslint@0.0.6',
    ...lines(process.env.INPUT_ARGS),
    ...lines(process.env.INPUT_SUPPRESS).map((check) => `--suppress=${check}`),
  ],
  {
    cwd: process.env.GITHUB_WORKSPACE,
    stdio: 'inherit',
    env: {...process.env, npm_config_ignore_scripts: 'true'},
  },
)
if (outcome.error) {
  console.error(outcome.error.message)
}
process.exit(outcome.status ?? 1)
