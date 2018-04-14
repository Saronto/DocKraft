#!/bin/bash

export LOCAL_USER_ID=`id -u`
export LOCAL_GROUP_ID=`id -g`

docker build --rm --build-arg LOCAL_USER_ID=${LOCAL_USER_ID} --build-arg LOCAL_GROUP_ID=${LOCAL_GROUP_ID} -t saronto/gtnh:0.2 .