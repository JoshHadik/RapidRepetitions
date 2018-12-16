#!/bin/bash
source .build/helpers/docker_helper.sh
source .build/helpers/travis_helper.sh

build_images_with_env_tag() {
  local env_tag=$1

  docker_helper::build_and_push_image proxy $env_tag ./proxy
  docker_helper::build_and_push_image view $env_tag ./view
}

if travis_helper::request_will_deploy?; then
  if travis_helper::current_branch_is? master; then
    build_images_with_env_tag prod
  fi

  if travis_helper::current_branch_is? development; then
    build_images_with_env_tag dev
  fi
fi
