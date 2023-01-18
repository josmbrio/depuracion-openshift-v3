#!/bin/bash

echo "--- Reinicio de pod heapster por llenado de FS /var/lib/docker"
oc delete pod $(oc get pods -n openshift-infra | grep Running | grep ^heapster | awk '{print $1}') -n openshift-infra
