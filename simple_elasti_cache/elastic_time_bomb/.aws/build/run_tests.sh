#!/bin/bash

start_docker_compose() {
  docker-compose up -d --build
}

run_tests() {
  docker-compose run web npm run test-suite
}

close_docker_compose() {
  docker-compose down
}

run_docker_compose_test_suite() {
  start_docker_compose

  run_tests
  local exit_status=$?

  close_docker_compose

  return $exit_status
}

run_docker_compose_test_suite
