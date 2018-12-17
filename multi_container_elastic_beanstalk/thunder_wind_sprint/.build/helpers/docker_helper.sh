source .build/helpers/travis_helper.sh

SHA=$SHA
IMAGE_PATH=$DOCKER_ID/$APP_NAME

# Builds image with three separate tags
# Example Tag 1 => dockerid/deep_jungle_cavern-web:dev.b78a713{...}
# Example Tag 2 => dockerid/deep_jungle_cavern-web:dev.latest
# Example Tag 3 => dockerid/deep_jungle_cavern-web:latest
build_image() {
  local name=$1 environment=$2 context=$3

  echo Building image $IMAGE_PATH-$name with $environment tags

  docker build -t "${IMAGE_PATH}-${name}:${environment}.${SHA}" \
               -t "${IMAGE_PATH}-${name}:${environment}.latest" \
               -t "${IMAGE_PATH}-${name}:latest" \
               -f $context/Dockerfile $context
}

# Pushes image to docker hub
push_image() {
  local name=$1 environment=$2

  echo Pushing image $IMAGE_PATH-$name with $environment tags

  docker push "${IMAGE_PATH}-${name}:${environment}.${SHA}"
  docker push "${IMAGE_PATH}-${name}:${environment}.latest"

  # Only push image with :latest tag if built for production
  if travis_helper::current_branch_is? master; then
    docker push "${IMAGE_PATH}-${name}:latest"
  fi
}

# Build and push image to docker hub at once
docker_helper::build_and_push_image() {
  local name=$1 environment=$2 context=$3

  build_image $name $environment $context
  push_image $name $environment
}
