#!/usr/bin/env bash
set -euo pipefail

echo Building app...
./gradlew :resources-service:bootJar
./gradlew :songs-service:bootJar

echo Building images, adding them to minikube...
minikube image build -t songs-image:1.0.0 ./songs-service
minikube image build -t resources-image:1.0.0 ./resources-service

echo Start k8s...
kubectl apply -f k8s/

