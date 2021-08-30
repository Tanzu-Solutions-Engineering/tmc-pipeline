#!/bin/bash

tmc cluster create -f ./tmc-pipeline/cluster.yaml

if [ $? -eq 0 ]
then
  echo "cluster create command successfully executed"
  exit 0
else
  echo "cluster create command failed.  Trying upgrade"
  tmc cluster update -f ./tmc-pipeline/cluster.yaml
fi

if [ $? -ne 0 ]
then
  echo "cluster upgrade command failed"
else
  echo "cluster upgrade command successfully executed"
fi
