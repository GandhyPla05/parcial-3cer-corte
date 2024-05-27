name: Snyk Security Scan

on: [push, pull_request]

jobs:
  security:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up Snyk
        uses: snyk/actions/setup@master
        with:
          version: 'latest'

      - name: Authenticate Snyk
        run: snyk auth ${{ secrets.SNYK_TOKEN }}

      - name: Run Snyk Code Test
        run: snyk code test --all-projects
