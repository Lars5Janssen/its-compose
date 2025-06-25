#!/bin/bash
git pull
git submodule update --remote
docker compose up --build
