#!/bin/bash

docker build -t web1-diaz .
docker tag web1-diaz:latest secretpoint/web1-diaz:latest
docker login -u secretpoint
docker push secretpoint/web1-diaz:latest

chmod +x run.sh
./run.sh
