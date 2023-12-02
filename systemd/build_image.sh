#!/bin/bash
#
# set -x

declare -A distrubution_array
distrubution_array[debian]="10,11"
distrubution_array[ubuntu]="18.04,20.04,22.04"


for distribution in "${!distrubution_array[@]}"
do
  os=${distribution}
  os_version_list=${distrubution_array[${distribution}]}
  echo "os : ${distribution}" -- "os_version_list: ${os_version_list}"
  for os_version in ${distrubution_array[${distribution}]//,/ }
  do
    echo "os : ${distribution}" -- "os_version: ${os_version}"
    IMAGE_NAME=org.tecris/${os}_${os_version}-systemd:23.12.02
    echo ${IMAGE_NAME}

    docker buildx build \
      --no-cache \
      --progress=plain \
      -t ${IMAGE_NAME} \
      -f ${os}-${os_version}/Dockerfile \
      ./

    docker buildx build \
      --load \
      -t ${IMAGE_NAME} \
      ./${os}-${os_version}
  done

done

