#!/bin/bash
source .build/helpers/travis_helper.sh

# Replaces all instances of string "${env_tag}" in dockerrun template with the passed in env tag, and adds Dockerrun.aws.json file to the root directory.
setup_dockerrun_with_env_tag() {
  local env_tag=$1
  local template_path=.build/templates/dockerrun.template.json

  local replace_env_tag="s|\${env_tag}|${env_tag}|"
  local replace_app_name="s|\${app_name}|${APP_NAME}|"
  local replace_docker_id="s|\${docker_id}|${DOCKER_ID}|"

  echo Creating Dockerrun.aws.json with \"$env_tag\" environment tag

  sed -e $replace_env_tag \
      -e $replace_app_name \
      -e $replace_docker_id \
      $template_path > Dockerrun.aws.json
  git add .
}

if travis_helper::request_will_deploy?; then
  if travis_helper::current_branch_is? master; then
    setup_dockerrun_with_env_tag prod
  fi

  if travis_helper::current_branch_is? development; then
    setup_dockerrun_with_env_tag dev
  fi
fi
