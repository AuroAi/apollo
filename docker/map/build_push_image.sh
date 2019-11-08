#!/usr/bin/env bash

# Use this script to package an apollo map directory into a docker image and
# push to a docker repo.  This should fail for users without access to the 
# auroai repo, but can be modified to push to another repo.
# ex: ./build_push_image.sh carla_town01

MAP_NAME=$1
rm -r map_data/*
cp -r ../../modules/map/data/$MAP_NAME map_data
IMAGE=auroai/map_apollo_$MAP_NAME
docker build --build-arg map_name=$MAP_NAME -t $IMAGE .
docker push $IMAGE