#!/bin/bash

docker build -t web:test -f Dockerfile.dev .
docker run web:test npm run test-suite
