#!/bin/bash
echo "Building container image based on Dockerfile..."
docker build --build-arg http_proxy=http://proxy.lbs.alcatel-lucent.com:8000 --build-arg https_proxy=http://proxy.lbs.alcatel-lucent.com:8000 -t host-alpine:latest .

