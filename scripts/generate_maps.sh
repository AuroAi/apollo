#!/usr/bin/env bash

# use this script to generate all the other map formats from base_map.xml
# ex: ./scripts/generate_maps.sh modules/map/data/carla_town01

./scripts/generate_routing_topo_graph.sh --map_dir=$1
bazel-bin/modules/map/tools/sim_map_generator --map_dir=$1 --output_dir=$1 --downsample_distance=1
bazel-bin/modules/map/tools/proto_map_generator --map_dir=$1 --output_dir=$1
bazel-bin/modules/map/tools/bin_map_generator --map_dir=$1 --output_dir=$1
