#!/bin/bash

function healthCheck() {
    echo "Waiting for Structr to be ready for deployment"
    for i in $(seq 1 30)
    do
      STATUS_CODE=$(curl --write-out %{http_code} localhost:8082/structr/health/ready)
      
      if [ "$STATUS_CODE" -ne 200 ] ; then
        echo "Status is $STATUS_CODE. Still waiting for Structr to start..."
        sleep 5
      else
        echo "Running Structr instance found"
        return 0
      fi
    done
    echo "Structr failed to start. Exiting..."
    exit 1
}

function deploy() {
    exec 3>&1
    STATUS_CODE=$(curl --write-out %{http_code} \
    -HX-User:superadmin -HX-Password:superuser \
    --silent -XPOST http://localhost:8082/structr/rest/maintenance/deploy -d '{mode:"import", source:"/repository"}' \
    -o >(cat >&3))
    if [ "$STATUS_CODE" -ne 200 ] ; then
      echo "$STATUS_CODE Deployment failed!"
      exit 1
    else
      echo "$STATUS_CODE: Deployment successfull!"
    fi
}

healthCheck
deploy