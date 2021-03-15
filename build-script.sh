docker build --tag coturnbuilder .
docker create -ti --name dummy coturnbuilder:latest bash
docker cp dummy:/package $(dirname "$0")/read-to-install-package-builded-in-docker
docker rm -f dummy