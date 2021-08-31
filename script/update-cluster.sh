#!/bin/bash

tmc cluster create -f cluster.yaml

if [ $? -eq 0 ]
then
  echo "cluster create command successfully executed"
  exit 0
else
  echo "cluster create command failed.  Trying update"
  tmc cluster update -f cluster.yaml
fi

if [ $? -ne 0 ]
then
  echo "cluster update command failed"
  exit 1
else
  echo "cluster update command successfully executed"
fi
