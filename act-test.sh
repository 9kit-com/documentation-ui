#!/bin/bash

# Script to run GitHub Actions workflow locally using Act Runner
# https://github.com/nektos/act

# Check if act is installed
if ! command -v act &> /dev/null; then
    echo "Error: Act Runner is not installed."
    echo "Please install it following the instructions at: https://github.com/nektos/act#installation"
    exit 1
fi

echo "Running GitHub Actions workflow using Act Runner..."
echo "=================================================="

# Run the workflow with act
# Using --workflows flag to specify the workflow file
# Using --job build to run only the build job
act --workflows .github/workflows/ci.yml --job build

# Check the exit status
if [ $? -eq 0 ]; then
    echo "=================================================="
    echo "✅ Workflow completed successfully!"
else
    echo "=================================================="
    echo "❌ Workflow failed. Please check the output above for errors."
    exit 1
fi
