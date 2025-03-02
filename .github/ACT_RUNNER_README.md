# Act Runner Test for Antora UI Default

This directory contains GitHub Actions workflow files that can be tested locally using [Act Runner](https://github.com/nektos/act).

## What is Act Runner?

Act Runner (nektos/act) is a tool that allows you to run GitHub Actions workflows locally. It uses Docker to run the workflows in an environment similar to GitHub Actions.

## Prerequisites

- [Docker](https://www.docker.com/) installed and running
- [Act Runner](https://github.com/nektos/act) installed

### Installing Act Runner

#### On macOS (using Homebrew):
```bash
brew install act
```

#### On Linux:
```bash
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

#### On Windows (using Chocolatey):
```bash
choco install act-cli
```

For other installation methods, see the [Act Runner documentation](https://github.com/nektos/act#installation).

## Running the Tests

We've provided a script to run the tests:

```bash
./act-test.sh
```

This script will:
1. Check if Act Runner is installed
2. Run the GitHub Actions workflow defined in `.github/workflows/ci.yml`
3. Report the results

Alternatively, you can run Act Runner directly:

```bash
act --workflows .github/workflows/ci.yml --job build
```

## Workflow Details

The workflow in `ci.yml` tests:
- Node.js compatibility (versions 10.x, 12.x, 14.x)
- Dependency installation
- Code linting
- UI bundle building

## Troubleshooting

If you encounter issues:

1. Make sure Docker is running
2. Check that you have sufficient disk space for Docker images
3. Try running with verbose output: `act -v --workflows .github/workflows/ci.yml`
4. For memory issues, you can limit the resources: `act --workflows .github/workflows/ci.yml --job build -P ubuntu-latest=node:14-slim`
