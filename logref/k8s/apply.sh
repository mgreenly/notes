#!/bin/sh


kubectl apply -f logref-www.yaml
kubectl apply -f logref-api.yaml
kubectl apply -f logref-proxy.yaml
