#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

echo "************ ofcir packet teardown command ************"

set -x
CIRFILE=$SHARED_DIR/cir
if [ -e $CIRFILE ] ; then
    OFCIRURL="https://ofcir-service.ofcir-system.svc.cluster.local/v1/ofcir"
    OFCIRTOKEN="a90a2157-09b2-4e30-9174-23e647787ab2"
    curl -kfX DELETE -H "X-OFCIRTOKEN: $OFCIRTOKEN" "$OFCIRURL/$(jq -r .name < $CIRFILE)?name=$JOB_NAME/$BUILD_ID"
    exit 0
fi
