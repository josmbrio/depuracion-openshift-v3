#!/bin/bash

set -a
source .env
set +a

oc whoami > /dev/null 2>&1
if [ "$?" -ne 0 ]
then
 echo Logeando...
 oc login -u $OCP_USER -p $OCP_PASSWORD $OCP_URL
fi

# Depurar /var/lib/docker en nodos worker si tiene mas del 75% de uso
./clean_docker_images.sh

# Limpiar pods en estado Evicted en proyectos de Openshift
./clean_evicted_pods.sh

# Depurar builds, deployments e imagenes
./prune_openshift.sh

# Restart heapster pod 
./restart_pod.sh