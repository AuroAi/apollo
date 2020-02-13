image=${1}
# pattern for docker image: user/repo:tag (:tag is optional)
REGEX_PATTERN='^([^:\/]+)\/([^:\/]+)(:([^:\/]+))?$'

if [[ ${image} =~ ${REGEX_PATTERN} ]]; then
    DOCKER_USER=${BASH_REMATCH[1]}
    REPO=${BASH_REMATCH[2]}
    TAG=${BASH_REMATCH[4]}
    MAP_VOLUME="apollo_map_volume-${REPO}_${USER}"
    if [[ ${MAP_VOLUME_CONF} == *"${MAP_VOLUME}"* ]]; then
        echo "Map has already been included: ${REPO}"
    else
        docker stop ${MAP_VOLUME} > /dev/null 2>&1

        docker pull ${image}
        docker run -it -d --rm --name ${MAP_VOLUME} ${image}
        MAP_VOLUME_CONF="${MAP_VOLUME_CONF} --volumes-from ${MAP_VOLUME}"
    fi
else
    echo "Invalid docker image specified: ${image}"
fi