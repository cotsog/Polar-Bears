#!/usr/bin/env bash

sudo apt-get remove docker docker-engine docker.io docker-ce
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo apt-get install -y software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y docker-ce
