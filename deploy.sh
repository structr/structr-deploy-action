#!/bin/bash

function healthCheck() {
    echo "Waiting for Structr to be ready for deployment"
    for i in $(seq 1 30)
    do
      status_code=$(curl --write-out %{http_code} --silent localhost:8082/structr/health/ready)
      if [ "$status_code" -ne 200 ] ; then
        sleep 3
      else
        return 0
      fi
    done
    echo "Structr failed to start. Exiting..."
    exit 1
}

function deploy() {
    exec 3>&1
    status_code=$(curl --write-out %{http_code} \
    -HX-User:superadmin -HX-Password:superuser \
    --silent -XPOST http://localhost:8082/structr/rest/maintenance/deploy -d '{mode:"import", source:"/repository"}' \
    -o >(cat >&3))
    if [ "$status_code" -ne 200 ] ; then
      echo "$status_code Deployment failed!"
      exit 1
    else
      echo "$status_code: Deployment successfull!"
    fi
}

healthCheck
deploy