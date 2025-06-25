#!/bin/bash
git pull
git submodule update --remote
docker compose up --build
rm -rf ./tcpdumpinfo/
docker cp tcp:/tcpdumpinfo/ .
ls ./tcpdumpinfo/
