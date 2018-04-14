#!/bin/bash

docker stop DocKraft

docker run --rm -d -p 25565:25565 --name DocKraft saronto/gtnh:0.2