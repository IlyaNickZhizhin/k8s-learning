#!/usr/bin/env bash
set -euo pipefail

echo Building app...
./gradlew :resources-service:bootJar
#./gradlew :songs-service:bootJar - for now this should be done manually with following commands
  # 1. docker build -t ilyazhizhin/songs-image:1.1.0 ./songs-service
  # 2. docker push ilyazhizhin/songs-image:1.1.0

echo Building images, adding them to minikube...
#minikube image build -t songs-image:1.0.0 ./songs-service
minikube image build -t resources-image:1.0.0 ./resources-service

echo Start k8s...
kubectl apply -f k8s/

