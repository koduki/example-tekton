#!/bin/bash

docker run -it -v $HOME:/home/user -v /var/run/docker.sock:/var/run/docker.sock koduki/env-dev4tekton
