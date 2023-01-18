#!/bin/bash

echo "--- Depurar /var/lib/docker en nodos worker si tiene mas del 75% de uso"

for node in $(oc get nodes| grep "dgdc-ocp-node" | cut -d " " -f 1)
do
  echo " -- Evaluando $node..."
  saturado=$(ssh $node "df /var/lib/docker | tail -n1 | awk '{if (int(\$5)>75) print \"yes\"; else print \"no\"}'")
  if [ $saturado = "yes" ]; then
   echo "  - Depurando /var/lib/docker"
   ssh $node 'docker rmi $(docker images -q -f dangling=true)'
  fi
done
