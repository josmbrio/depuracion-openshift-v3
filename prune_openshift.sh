#!/bin/bash

echo
echo "--- Depurando Builds"
oc adm prune  builds --confirm=true

echo
echo "--- Depurando Deployments"
oc adm prune  deployments --confirm

echo
echo "--- Depurando Imágenes"
oc adm prune images --confirm=true --registry-url $REGISTRY_URL

echo
echo "--- LISTO!"