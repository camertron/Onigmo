#! /bin/sh

docker build -t onigmo:latest .
docker run -v $PWD:/usr/src/onigmo --rm -it onigmo:latest
