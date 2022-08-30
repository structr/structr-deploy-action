# Structr Deploy Action
This action starts Structr and Neo4j and deploys a given webapp. The resulting stack can be used for testing or other CI purposes.

Structr can be accessed via `localhost:8082` after this action has been completed.

## Inputs
 - `structr-version`: The version of Structr to start. Defaults to "4.2.0"
 - `neo4j-version`: The version of Neo4j to use. Defaults to "4.4"
 - `structr-webapp-path`: The absolute path to the folder containing the Structr webapp. Defaults to "${{ github.workspace }}/webapp"
 - `structr-license`: A valid Structr license key. Best passed from a secret in Github,

## Used context variables
- `${{ github.workspace }}`
- `${{ github.action_path }}`

## Example configuration: 
```
jobs:
  deploy-job:
    runs-on: ubuntu-latest
    name: Deploy and test
    steps:
      - uses: actions/checkout@v3
      - uses: structr/structr-deploy-action@v1
        with:
          neo4j-version: '4.4'
          structr-version: '4.3-SNAPSHOT'
          structr-webapp-path: '${{ github.workspace }}/webapp'
          structr-license: '${{ secrets.STRUCTR_LICENSE }}'
```
