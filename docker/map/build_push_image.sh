#!/usr/bin/env bash

# Use this script to package an apollo map directory into a docker image and
# push to a docker repo.  This should fail for users without access to the 
# auroai repo, but can be modified to push to another repo.
# ex: ./build_push_image.sh carla_town01 0.9.6

MAP_NAME=$1
TAG=$2

IMAGE=auroai/map_apollo_$MAP_NAME
if [ ! -z $TAG ]; then
    IMAGE=$IMAGE:$TAG
fi
rm -r map_data/*
cp -r ../../modules/map/data/$MAP_NAME map_data
docker build --build-arg map_name=$MAP_NAME -t $IMAGE .
docker push $IMAGE