name: Security Analysis

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  security_scan:
    name: Security Scan
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install Snyk
        run: npm install -g snyk

      - name: Authenticate with Snyk
        run: snyk auth ${{ secrets.SNYK_TOKEN }}

      - name: Run security analysis
        run: snyk test --all-projects --dev

      - name: Upload Snyk results
        uses: actions/upload-artifact@v2
        with:
          name: snyk-results
          path: .snyk


