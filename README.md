# xslint-action

[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE.txt)

GitHub Action for [xslint](https://github.com/maxonfjvipon/xslint) - a CLI tool for checking the 
  quality of XSL stylesheets.

## Usage

Add this action to your workflow:

```yaml
name: xslint
on: [push, pull_request]
jobs:
  xslint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: maxonfjvipon/xslint-action@v0.0.2
```

### Examples

Lint a specific directory:

```yaml
- uses: maxonfjvipon/xslint-action@v0.0.2
  with:
    dir:
      - src/xsl
```

Suppress specific checks:

```yaml
- uses: maxonfjvipon/xslint-action@v0.0.2
  with:
    suppress:
      - short-names
      - template-match-are-you-confusing-variable-and-node
```

