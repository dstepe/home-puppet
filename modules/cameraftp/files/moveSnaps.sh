#!/bin/sh

set -e
set -u

camera=""

while [[ $# > 1 ]]
do
key="$1"

case $key in
  --camera)
  camera="$2"
  shift # past argument
  ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

cameraDir=/var/cameras/$camera
archiveDir=/var/cameras/archive

cd $cameraDir/snap

for x in *.jpg; do
  d=$(date -r "$x" +%Y-%m-%d)
  mkdir -p "$archiveDir/$camera/$d"
  mv -- "$x" "$archiveDir/$camera/$d/"
done
