# GitHub Action for PHPLint

[GitHub Action](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) implementation of the 
PHPLint Package provided by [@Overtrue/phplint](https://github.com/overtrue/phplint). 

## Usage

Create a new workflow file under `.github/workflows` inside your repository 
(e.g. [.github/workflows/phplint.yml](examples/.github/workflows/phplint.yml)).

```yaml
name: PHPLint

on: [push, pull_request]

jobs:
  phplint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: "Run PHPLint"
        uses: "web-weit/phplint-action@v1"
        with:
          path: "src/"
```

## Inputs

| Name | Description | Default |
| --- | --- | --- |
| `path` | Path to be linted | `.` |
| `config_file` | Path to phplint config file | `.phplint.yml` |
| `jobs` | Amount of parallel jobs | `10` |
| `extensions` | Check for file extensions | `php` |
| `exclude` | Exclude path | `vendor,node_modules` |
| `warning` | Show warnings | `true` |

## Configuration

If provided, a `.phplint.yml` will be used for configuration during run of the Action.
For more information see the official documentation of [phplint](https://github.com/overtrue/phplint#configuration).

```yaml
path:
    - ./src
    - ./tests
jobs: 10
extensions:
    - php
exclude:
    - vendor
    - node_modules
warning: true
```
