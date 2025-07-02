#!/bin/bash
# Script pour builder le binaire Seafile et construire l'image Docker finale sans copier le build output
# Usage: ./build_and_dockerize.sh <version> (ex: 12.0.14)

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <version> (ex: 12.0.14)"
  exit 1
fi

VERSION="$1"
BUILD_DIR="$(dirname "$0")/build"
DOCKER_CONTEXT="$(dirname "$0")"
BINARY_SRC="$BUILD_DIR/seafile-server-$VERSION"

echo "Version: $VERSION"
echo "Build directory: $BUILD_DIR"
echo "Docker context: $DOCKER_CONTEXT"
ls -l "$DOCKER_CONTEXT/../../"
pwd

# 1. (Optionnel) Générer le binaire si besoin
if [ ! -d "$BINARY_SRC" ]; then
  echo "Binaire $BINARY_SRC introuvable. Lancement du build..."
  (cd "$BUILD_DIR" && docker run --rm --volume=/$(pwd):/seafile --volume=/$(pwd)/../../../apps:/apps ubuntu:22.04 /seafile/build.sh $VERSION)
else
  echo "Binaire déjà présent: $BINARY_SRC"
fi

# 2. Construire l'image Docker en passant le chemin du build output comme build-arg
IMAGE_NAME="estiam-files:$VERSION"
docker build -t "$IMAGE_NAME" \
  --build-arg SEAFILE_VERSION="$VERSION" \
  --build-arg BINARY_SRC_REL="../build/seafile-server-$VERSION" \
  -f "$DOCKER_CONTEXT/image/Dockerfile" \
  "$DOCKER_CONTEXT"
echo "Image Docker construite: $IMAGE_NAME"
