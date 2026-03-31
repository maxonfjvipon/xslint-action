# xslint-action

[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE.txt)

GitHub Action for [xslint](https://github.com/maxonfjvipon/xslint) - a CLI tool
for checking the quality of XSL stylesheets.

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
      - uses: maxonfjvipon/xslint-action@0.0.2
```

### Examples

Lint a specific directory and/or file:

```yaml
- uses: maxonfjvipon/xslint-action@0.0.2
  with:
    args:
      - 'src/xsl'
      - 'resources/hello.xsl'
```

Suppress specific checks:

```yaml
- uses: maxonfjvipon/xslint-action@0.0.2
  with:
    suppress:
      - 'short-names'
      - 'template-match-are-you-confusing-variable-and-node'
```

## How to Contribute

Fork repository, make changes, then send us a [pull request][guidelines].
We will review your changes and apply them to the `master` branch shortly,
provided they don't violate our quality standards. To avoid frustration,
before sending us your pull request please make sure all your tests pass:

```bash
make
```

You will need GNU [make] installed

## License

Copyright (c) 2026 Max Trunnikov. MIT License.

[guidelines]: https://www.yegor256.com/2014/04/15/github-guidelines.html
[make]: https://www.gnu.org/software/make/manual/make.html
