#!/bin/bash

echo "--- Limpiar pods en estado Evicted en proyectos de Openshift"
oc get pods --all-namespaces | grep -v ^claro | grep Evicted | awk '{print "oc delete pod "$2" -n "$1}' | source /dev/stdin