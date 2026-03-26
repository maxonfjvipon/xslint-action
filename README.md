# xslint-action

[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE.txt)

GitHub Action for [xslint](https://github.com/maxonfjvipon/xslint) - a CLI tool
for checking the quality of XSL stylesheets.

## What is xslint?

xslint is a linter for XSL stylesheets that helps enforce best practices and
detect common mistakes in XSLT code. It checks for issues like:

- Incorrect use of template matching patterns
- Unused functions, templates, and variables
- Performance issues (e.g., using `//` in match patterns)
- Code complexity warnings
- Naming convention violations

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

### Inputs

| Input     | Required | Default | Description                                      |
|-----------|----------|---------|--------------------------------------------------|
| `dir`     | No       | `.`     | Directory to lint                                |
| `suppress`| No       | -       | Checks to suppress (comma-separated)             |

### Examples

Lint a specific directory:

```yaml
- uses: maxonfjvipon/xslint-action@v0.0.2
  with:
    dir: src/xsl
```

Suppress specific checks:

```yaml
- uses: maxonfjvipon/xslint-action@v0.0.2
  with:
    dir: .
    suppress: short-names,template-match-are-you-confusing-variable-and-node
```

Suppress checks by substring:

```yaml
- uses: maxonfjvipon/xslint-action@v0.0.2
  with:
    dir: .
    suppress: template-match
```

## Available Checks

- `template-match-starts-with-double-slash` - Match pattern starting with `//`
- `template-match-use-double-slash` - Using `//` in match attribute
- `template-match-setting-value-of-variable-incorrectly` - Incorrect variable
- `template-match-empty-content-in-instructions` - Empty content in instructions
- `template-match-use-node-set-extension` - Unnecessary node-set extension
- `template-match-unused-function` - Unused stylesheet functions
- `template-match-unused-named-template` - Unused named templates
- `template-match-unused-variable` - Unused variables
- `template-match-unused-function-template-parameter` - Unused parameters
- `template-match-too-many-small-templates` - Too many low-granular templates
- `template-match-monolithic-design` - Single monolithic template
- `template-match-output-method-xml` - Wrong output method
- `template-match-not-using-schema-types` - Not using Schema types
- `template-match-function-template-complexity` - High complexity
- `template-match-null-output-from-stylesheet` - No useful output
- `template-match-using-namespace-axis` - Deprecated namespace axis
- `template-match-can-use-abbreviated-axis-specifier` - Verbose axis specifiers
- `template-match-using-disable-output-escaping` - Incorrect D-O-E usage
- `template-match-not-creating-element-correctly` - Incorrect element creation
- `template-match-are-you-confusing-variable-and-node` - Variable/node confusion
- `template-match-incorrect-use-of-boolean-constants` - Boolean constant misuse
- `template-match-short-names` - Single character names
- `template-match-name-starts-with-numeric` - Name starts with number

## License

Copyright (c) 2026 Max Trunnikov. MIT License.
