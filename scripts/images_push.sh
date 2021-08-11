#!/bin/bash

error()
{
    echo "[ERROR]:" "$1" "EXITING"1>&2
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

output "Pushing acarli/team_2_angularpet to dockerhub"

if [[ ! "$(docker images -q acarli/team_2_angularpet:latest 2> /dev/null)" == "" ]]; then
    output "Image exists"
    docker push acarli/team_2_angularpet
fi

output "Pushing acarli/team_2_javapet to dockerhub"

if [[ ! "$(docker images -q acarli/team_2_javapet:latest 2> /dev/null)" == "" ]]; then
    output "Image exists"
    docker push acarli/team_2_javapet
fi

output "Pushing acarli/nginx to dockerhub"

if [[ ! "$(docker images -q qa/nginx:latest 2> /dev/null)" == "" ]]; then
    output "Image exists"
    docker push acarli/nginx
fi