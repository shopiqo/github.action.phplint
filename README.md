# GitHub Action for PHPLint

[GitHub Action](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) implementation of the 
PHPLint Package provided by [@Overtrue/phplint](https://github.com/overtrue/phplint). 

## Usage

Create a new workflow file under `.github/workflows` inside your repository 
(e.g. [.github/workflows/phplint.yml](examples/.github/workflows/phplint.yml)).

If provided, a `.phplint.yml` will be used for configuration during run of the Action.