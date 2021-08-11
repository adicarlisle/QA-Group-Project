#!/bin/bash

sudo docker login --username acarli --password $dockerhubpass
echo $dockerhubpass

error()
{
    echo "[ERROR]:" "$1" "EXITING" 1>&2
    exit 1
}

warning()
{
    echo "[WARNING]:" "$1" 1>&2
}

output()
{
    echo "[OUTPUT]:" "$1" 1>&2
}

output "Updating to make sure the latest security patches are installed"
sudo apt update -y

if [[ "$(aws --version 2> /dev/null)" == "" ]]; then
    error "AWS CLI is not installed"
fi


aws eks update-kubeconfig --name qa_cluster