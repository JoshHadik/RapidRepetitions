#!/bin/bash
EB_ENV=$EB_ENV

move_ebextensions() {
  [ -d .ebextensions ] || mkdir .ebextensions

  if [ -d .aws/build/ebextensions ]; then
    echo Moving constant ebextensions
    cp .aws/build/ebextensions/* .ebextensions
  fi

  if [ -d .aws/build/ebextensions/$EB_ENV ]; then
    echo Moving ebextensions for $EB_ENV
    cp .aws/build/ebextensions/$EB_ENV/* .ebextensions
  fi
}

move_ebextensions
