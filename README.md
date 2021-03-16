## Recipe for own coturn *.deb package build

### How to run this?

```
.\build-script.sh
```

or manualy build docker image and then somehow copy contents of (root path) /package (there will be builded coturn package)

##### This repository contains already modified coturn version (4.5.2-2) builded and archived as *.deb package.

### How does it works?

Dockerfile (recipe) steps:

1. Install build dependencies for coturn & checkinstall
2. Copy coturn modified source code folder (from host to building image)
3. Build coturn from raw source code and prepare *.deb package

build-script.sh (script for obtain builded and archived coturn from docker image) steps:

1. Build image from recipe
2. Create container from image and create 'connection'
3. Copy coturn archive from container to host 
4. Remove container